module ActiveRecordSunspotter
	class Railtie < ::Rails::Railtie
		initializer 'add_helpers_to_actionview' do |app|
			ActiveSupport.on_load :action_view do
				ActionView::Base.send(:include, ActiveRecordSunspotter::SunspotHelper)
			end
		end
#		rake_tasks do
#			Dir["#{File.dirname(__FILE__)}/../tasks/**/*.rake"].sort.each { |ext| load ext }
#		end
	end
end
