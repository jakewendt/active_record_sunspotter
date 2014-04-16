module ActiveRecordSunspotter
	class Railtie < ::Rails::Railtie
		initializer 'add_helpers_to_actionview' do |app|
			ActiveSupport.on_load :action_view do
				ActionView::Base.send(:include, ActiveRecordSunspotter::SunspotHelper)
				#	:sunspot would require sunspot_helper.rb be in one of the magical load paths.
				#ActionController::Base.helper :sunspot
				#	So much simpler to just pass the module name.
				ActionController::Base.helper ActiveRecordSunspotter::SunspotHelper
			end
		end
#		rake_tasks do
#			Dir["#{File.dirname(__FILE__)}/../tasks/**/*.rake"].sort.each { |ext| load ext }
#		end
	end
end
