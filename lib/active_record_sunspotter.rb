
#	why do I have to explicitly require it here, but not when gem included in app's Gemfile?
require 'sunspot_rails'

module ActiveRecordSunspotable; end
require 'active_record_sunspotable/sunspot_column'
require 'active_record_sunspotable/sunspotability'
#require 'active_record_sunspotable/sunspot_controller'
require 'active_record_sunspotable/search_sunspot_for'
require 'active_record_sunspotable/sunspot_helper'
