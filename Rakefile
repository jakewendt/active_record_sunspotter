



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
		gem.files += FileList['vendor/**/*.erb']
		gem.files += FileList['vendor/**/*.js']
		gem.files += FileList['vendor/**/*.css']
		gem.files += FileList['vendor/**/*.css.scss']
		gem.files -= FileList['**/versions/*']
	end
	Jeweler::GemcutterTasks.new
rescue LoadError
	puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

