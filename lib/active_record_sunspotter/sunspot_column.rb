require 'ostruct'
class ActiveRecordSunspotter::SunspotColumn < OpenStruct

	def initialize(*args)
		#	some sensible defaults
		default_options = {
			:group     => 'Main',
			:type      => :string, 
			:orderable => true, 
			:facetable => false, 
			:filterable => false, 
			:multiple  => false, 
			:default   => false
		}
		options = args.extract_options!.with_indifferent_access
		if [String,Symbol].include?( args.first.class ) and !options.has_key?(:name)
			options[:name] = args.first.to_s
		end

		default_options.update(options)
		default_options[:orderable] = false if options[:multiple]
		default_options[:filterable] = true if options[:facetable]
		super default_options
	end

	def hash_table
		instance_variable_get("@table")
	end

	def to_s
		name
	end

end


__END__


Add :index option.  Default to true.
False would effectively mean that it is only useful as a column.
This may be the same as facetable.
WAIT!  If aren't indexed, then can't be sorted on.

So could skip adding if weren't facetable, orderable or multiple.

