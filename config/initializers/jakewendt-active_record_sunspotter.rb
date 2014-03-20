require "jakewendt-active_record_sunspotter"

#	Unfortunately, this doesn't load early enough, so need to explicitly
#	load the engine so the helpers load

#	the engine may load, but 
#module ActiveRecordSunspotter
#	module Rails
#		class Engine < ::Rails::Engine
#		end
#	end
#end

#	I think that this loads too late
#module ActiveRecordSunspotter
#	class Railtie < ::Rails::Railtie
#		initializer 'add_helpers_to_actionview' do |app|
#			ActiveSupport.on_load :action_view do
#				ActionView::Base.send(:include, ActiveRecordSunspotter::SunspotHelper)
#				ActionController::Base.helper :sunspot
#			end
#		end
##		rake_tasks do
##			Dir["#{File.dirname(__FILE__)}/../tasks/**/*.rake"].sort.each { |ext| load ext }
##		end
#	end
#end

#	so

ActionView::Base.send(:include, ActiveRecordSunspotter::SunspotHelper)
#ActionController::Base.helper :sunspot
