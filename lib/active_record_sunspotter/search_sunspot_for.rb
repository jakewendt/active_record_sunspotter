module ActiveRecordSunspotter::SearchSunspotFor

	def search_sunspot_for( search_class )
		@sunspot_search_class = search_class

		#	Formerly a before_filter, but after being genericized,
		#	we don't know the search class until the search begins.
		@sunspot_search_class.methods.include?(:search) ||
			access_denied("Sunspot server probably wasn't started first!", root_path)

		begin
			@search = @sunspot_search_class.search do

				if params[:q].present?
					fulltext params[:q]
				end

				self.instance_variable_get('@setup').clazz.sunspot_all_filters.each do |f|	#	don't use |facet|

					p=f.name

					if f.range

						range_facet_and_filter_for(p,params.dup,f.range)

					else

						if params[p]
							#
							#	20130423 - be advised that false.blank? is true so the boolean attributes
							#						will not work correctly here.  Need to find another way.
							#			I don't use boolean columns anymore
							#
							params[p] = [params[p].dup].flatten.reject{|x|x.blank?}

							if params[p+'_op'] && params[p+'_op'].match(/AND/i).present?
								unless params[p].blank?	#	empty?	#	blank? works for arrays too
									with(p).all_of params[p]
								else
									params.delete(p)	#	remove the key so doesn't show in view
								end

							#
							#	NOTE This is an INTEGER SORT for the BETWEEN filter!
							#
							elsif params[p+'_op'] && params[p+'_op'].match(/BETWEEN/i).present?
								unless params[p].blank?	#empty?	# blank? works for arrays too
									#	between is expecting an array with a first and last (can be array of 1 really)
									with(p).between [params[p].sort_by(&:to_i)].flatten
								else
									params.delete(p)	#	remove the key so doesn't show in view
								end

							else	#	using 'OR'
								unless params[p].blank?	#empty?	# blank? works for arrays too
									with(p).any_of params[p]
								else
									params.delete(p)	#	remove the key so doesn't show in view
								end
							end	#	if params[p+'_op'] && params[p+'_op']=='AND'

						end	#	if params[p]

						#	facet.sort
						#	This param determines the ordering of the facet field constraints.
						#	    count - sort the constraints by count (highest count first)
						#	    index - to return the constraints sorted in their index order 
						#			(lexicographic by indexed term). For terms in the ascii range, 
						#				this will be alphabetically sorted. 
						#	The default is count if facet.limit is greater than 0, index otherwise.
						#	Prior to Solr1.4, one needed to use true instead of count and false instead of index.
						#	This parameter can be specified on a per field basis. 
						#
						#	put this inside the else condition as the if block is
						#	for ranges and it calls facet
						facet p.to_sym, :sort => :index if f.facetable

					end	#	if child_age_facets.include?(p)
				end	#	@sunspot_search_class.sunspot_all_facets.each do |p|
	
				order_by *search_order
	
				if request.format.to_s.match(/csv|json/)
					#	don't paginate csv file.  Only way seems to be to make BIG query
					#	rather than the arbitrarily big number, I could possibly
					#	use the @search.total from the previous search sent as param?
					paginate :page => 1, :per_page => 1000000
				else
					paginate :page => params[:page], :per_page => params[:per_page]||=50
				end
			end	#	@search = @sunspot_search_class.search do

		rescue Errno::ECONNREFUSED
			flash[:error] = "Solr seems to be down for the moment."
			redirect_to root_path
		end	#	begin

	end

	def search_order
		if params[:order] and @sunspot_search_class.sunspot_orderable_column_names.include?(
				params[:order].downcase )
			order_string = params[:order]
			dir = case params[:dir].try(:downcase)
				when 'desc' then 'desc'
				else 'asc'
			end
			return order_string.to_sym, dir.to_sym
		else
			return :id, :asc
		end
	end

	::Sunspot::DSL::Search.class_eval do

		def range_facet_and_filter_for(field,params={},options={})
			start = (options[:start] || 20)	#.to_i
			stop  = (options[:stop]  || 50)	#.to_i
			step  = (options[:step]  || 10)	#.to_i
			log   = (options[:log]   || false)	#.to_i
			if params[field]
#	"expect"=>["1e-5..1e0"]
				any_of do
					params[field].each do |pp|
#						if pp =~ /^Under (\d+)$/
						if pp =~ /^Under (.+)$/
							with( field.to_sym ).less_than $1     #	actually less than or equal to
#						elsif pp =~ /^Over (\d+)$/
						elsif pp =~ /^Over (.+)$/
							with( field.to_sym ).greater_than $1  #	actually greater than or equal to
#						elsif pp =~ /^\d+\.\.\d+$/
						elsif pp =~ /^.+\.\..+$/
							with( field.to_sym, eval(pp) )
						elsif pp =~ /^\d+$/
							with( field.to_sym, pp )	#	primarily for testing?  No range, just value
						end
					end
				end
			end
			facet field.to_sym do
				if log
					row "Under 1e#{start}" do
						with( field.to_sym ).less_than "1e#{start}".to_f
					end
					(start..(stop-step)).step(step).each do |range|
						row "1e#{range}..1e#{range+step}" do
							with( field.to_sym, Range.new("1e#{range}".to_f,"1e#{range+step}".to_f) )
						end
					end
					row "Over 1e#{stop}" do
						with( field.to_sym ).greater_than "1e#{stop}".to_f
					end
				else
					#	row "text label for facet in view", block for facet.query
					row "Under #{start}" do
						#	Is less_than just less_than or does it also include equal_to?
						#	Results appear to include equal_to which makes it actually incorrect and misleading.
						with( field.to_sym ).less_than start		#	facet query to pre-show count if selected (NOT A FILTER)
					end
					#	this works when like 1-100 step 10
					(start..(stop-step)).step(step).each do |range|
						row "#{range}..#{range+step}" do
							with( field.to_sym, Range.new(range,range+step) )
						end
					end
					row "Over #{stop}" do
						#	Is greater_than just greater_than or does it also include equal_to?
						#	Results appear to include equal_to which makes it actually incorrect and misleading.
						with( field.to_sym ).greater_than stop
					end
				end
			end
		end

	end	#	Sunspot::DSL::Search.class_eval do

end
