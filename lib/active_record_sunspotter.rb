
#	why do I have to explicitly require it here, but not when gem included in app's Gemfile?
require 'sunspot_rails'

module ActiveRecordSunspotter; end
require 'active_record_sunspotter/sunspot_rails_server'
require 'active_record_sunspotter/sunspot_column'
require 'active_record_sunspotter/sunspotability'
require 'active_record_sunspotter/search_sunspot_for'
require 'active_record_sunspotter/sunspot_helper'


if defined?(Rails)
	require 'active_record_sunspotter/rails/engine'
	require 'active_record_sunspotter/rails/railtie'

	ActionController::Base.append_view_path( File.join(File.dirname(__FILE__), '../vendor/views'))
end
