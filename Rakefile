# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Sunspotter::Application.load_tasks



begin
	require 'jeweler'
	Jeweler::Tasks.new do |gem|
		gem.name = "jakewendt-active_record_sunspotter"
		gem.summary = %Q{active_record_sunspotter}
		gem.description = %Q{active_record_sunspotter}
		gem.email = "github@jakewendt.com"
		gem.homepage = "http://github.com/jakewendt/active_record_sunspotter"
		gem.authors = ["George 'Jake' Wendt"]
		# gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
		gem.files  = FileList['lib/**/*.rb']
		gem.files += FileList['lib/**/*.rake']
		gem.files -= FileList['lib/tasks/application.rake']	#	really don't want this in the gem
		gem.files += FileList['vendor/**/*.erb']
		gem.files += FileList['vendor/**/*.js']
		gem.files += FileList['vendor/**/*.css']
		gem.files += FileList['vendor/**/*.css.scss']
		gem.files -= FileList['**/versions/*']

		#	rails 4 uses /bin/ instead of /script/
		#	jeweler defaults to use the contents of /bin/ as executables.
		gem.executables = []
	end
	Jeweler::GemcutterTasks.new
rescue LoadError
	puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end


#
#	I think was only needed with 2.0.0 because was comparing version == 3 (bad idea)
#	if defined?(Rails) && Rails::VERSION::MAJOR == 3
#
#require 'sunspot/solr/tasks'

#	The above line is require for rake tasks for sunspot 2.0.0
#	but its presence causes sunspot to not start with sunspot 2.1.0
#
#	Successfully started Solr ...
#	rake aborted!
#	Sunspot::Solr::Server::AlreadyRunningError: Server is already running with PID 44877
#	
#	Tasks: TOP => sunspot:solr:start
