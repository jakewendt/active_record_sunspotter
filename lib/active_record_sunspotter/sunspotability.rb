module ActiveRecordSunspotter::Sunspotability
	def self.included(base)
		base.extend(ClassMethods)
		base.class_eval do
			
			#
			#	MUST delay execution of code until included as cattr_accessor is ActiveRecord specific
			#
			cattr_accessor :sunspot_columns
			cattr_accessor :sunspot_column_groups
			self.sunspot_columns = []		#	order is only relevant to the facets
			self.sunspot_column_groups = []
		end
	end

	module ClassMethods

		def add_sunspot_column(*args)
			new_column = ActiveRecordSunspotter::SunspotColumn.new( *args )
			sunspot_columns.push( new_column )
			sunspot_column_groups.push( new_column.group ) unless sunspot_column_groups.include?( new_column.group )
		end
	
		def sunspot_orderable_columns
			sunspot_columns.select{|c|c.orderable}
		end
	
		def sunspot_orderable_column_names
			sunspot_orderable_columns.collect(&:name)
		end
	
		def sunspot_default_columns
			sunspot_columns.select{|c|c.default}
		end
	
		def sunspot_default_column_names
			sunspot_default_columns.collect(&:name)
		end
	
		def sunspot_all_filters
			sunspot_columns.select{|c|c.filterable}
		end

		#	in the order that they will appear on the page
		def sunspot_all_facets
			sunspot_columns.select{|c|c.facetable}
		end
		def sunspot_all_facet_names
			sunspot_all_facets.collect(&:name)
		end
	
		def all_sunspot_columns
			sunspot_columns
		end
#		def sunspot_columns
#			all_sunspot_columns
#		end
	
		def sunspot_column_names
			sunspot_columns.collect(&:name)
		end
	
		def sunspot_available_column_names
			sunspot_column_names.sort
		end
	
		def sunspot_date_columns
			sunspot_columns.select{|c|c.type == :date }
		end

		def sunspot_columns_in_group(group)
			sunspot_columns.select{|c|c.group == group }
		end
		def sunspot_column_names_in_group(group)
			sunspot_columns.select{|c|c.group == group }.collect(&:name).sort
		end
	
		def searchable_plus(&block)
			searchable do

				sunspot_columns.select{|c| ![:boolean].include?(c.type) }.each{|c|
					options = {}
					options[:multiple] = true if( c.multiple )
					options[:trie] = true if( [:integer,:float,:time].include?(c.type) )
#					if c.type == :dynamic
#						dynamic_string c.namespace do 
#							c.kvp.call(self)
#						end
#					else
						send( c.type, c.name, options ){
							c.hash_table.has_key?(:meth) ? c.meth.call(self) : send( c.name )
						}
#					end
				}
	
				#
				#			yield if block_given?
				#			yield block if block_given?
				#
				#
				#	20140815 - Something like this is probably what is needed
				#		could then possibly just override the searchable method.
				#
				#	instance_exec(&block)
				#

			end	
			#
			#	this works, but why can't I just yield inside the block
			#
			searchable &block if block_given?
	
		end

	end	#	module ClassMethods

end
__END__
#
#	I don't think that trie works with :long or :double
#	I got this when I tried a :double
#	Trie fields are only valid for numeric and time types
#
#	I found documentation that says that Lucene/Solr should work for longs and doubles?
#
#
#	these are missing in sunspot 2.0.  I added them in my taxonomy app.
#	Still not in 2.1.1 sunspot-2.1.1/lib/sunspot/type.rb
#
#	module Sunspot::Type
#		class TrieDoubleType < DoubleType
#			def indexed_name(name)
#				"#{super}t"
#			end
#		end
#		class TrieLongType < LongType
#			def indexed_name(name)
#				"#{super}t"
#			end
#		end
#	end
#
#					options[:trie] = true if( [:integer,:long,:double,:float,:time].include?(c.type) )





What's the point of adding a column to the index that isn't faceted?
It would basically just be useful as a column, which is why I was
considering creating an "index" option.
WAIT!  If aren't indexed, then can't be sorted on.
