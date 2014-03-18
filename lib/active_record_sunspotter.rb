
#	why do I have to explicitly require it here, but not when gem included in app's Gemfile?
require 'sunspot_rails'

module ActiveRecordSunspotter; end
require 'active_record_sunspotter/sunspot_rails_server'
require 'active_record_sunspotter/sunspot_column'
require 'active_record_sunspotter/sunspotability'
require 'active_record_sunspotter/search_sunspot_for'
require 'active_record_sunspotter/sunspot_helper'


#	sunspot_rails_2.0.0 uses methods that are deprecated in rails 4
#	sunspot_rails_2.1.0 (or sunspot_2.1.0 or sunspot_solr_2.1.0) won't compile (java issues)
#	copied in this 1 file
require 'active_record_sunspotter/sunspot_rails_2.1.0_sunspot_rails_adapters'


if defined?(Rails)
	require 'active_record_sunspotter/rails/engine'
	require 'active_record_sunspotter/rails/railtie'

	# sunspot_solr-2.0.0 uses "Rails::VERSION::MAJOR == 3" which stops tasks from loading.
	#if defined?(Rails::Railtie)
	require 'sunspot/solr/railtie'
	#end

	ActionController::Base.append_view_path( File.join(File.dirname(__FILE__), '../vendor/views'))
end
