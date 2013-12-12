module ActiveRecordSunspotter::Sunspotability
	def self.included(base)
		base.extend(ClassMethods)
		base.class_eval do
			
			#
			#	MUST delay execution of code until included as cattr_accessor is ActiveRecord specific
			#
			cattr_accessor :all_sunspot_columns
			self.all_sunspot_columns = []		#	order is only relevant to the facets
		end
	end

	module ClassMethods

		def add_sunspot_column(*args)
			all_sunspot_columns.push( ActiveRecordSunspotter::SunspotColumn.new( *args ) )
		end
	
		def sunspot_orderable_columns
			all_sunspot_columns.select{|c|c.orderable}
		end
	
		def sunspot_orderable_column_names
			sunspot_orderable_columns.collect(&:name)
		end
	
		def sunspot_default_columns
			all_sunspot_columns.select{|c|c.default}
		end
	
		def sunspot_default_column_names
			sunspot_default_columns.collect(&:name)
		end
	
		#	in the order that they will appear on the page
		def sunspot_all_facets
			all_sunspot_columns.select{|c|c.facetable}
		end
		def sunspot_all_facet_names
			sunspot_all_facets.collect(&:name)
		end
	
		def sunspot_columns
			all_sunspot_columns
		end
	
		def sunspot_column_names
			all_sunspot_columns.collect(&:name)
		end
	
		def sunspot_available_column_names
			sunspot_column_names.sort
		end
	
		def sunspot_date_columns
			all_sunspot_columns.select{|c|c.type == :date }
		end
	
		def searchable_plus(&block)
			searchable do
				#
				#	Trying to simplify.  Simplify?  Minimize?
				#	Will I need all of the above methods after this is done?
				#
#	.select{|c| c.facetable }
#	or just use "sunspot_all_facets" instead of "all_sunspot_columns"
#	WAIT!  If aren't indexed, then can't be sorted on.
				all_sunspot_columns.select{|c| ![:boolean,:nulled_string].include?(c.type) }.each{|c|
					options = {}
					options[:multiple] = true if( c.multiple )
					options[:trie] = true if( [:integer,:long,:double,:float,:time].include?(c.type) )
					send( c.type, c.name, options ){
						c.hash_table.has_key?(:meth) ? c.meth.call(self) : send( c.name )
					}
	#
	#	booleans? nulled_strings?
	#
				}
	
	
	#			yield if block_given?
	#			yield block if block_given?
			end	
	
	#	this works, but why can't I just yield inside the block
			searchable &block if block_given?
	
		end

	end	#	module ClassMethods

end
__END__

What's the point of adding a column to the index that isn't faceted?
It would basically just be useful as a column, which is why I was
considering creating an "index" option.
WAIT!  If aren't indexed, then can't be sorted on.
