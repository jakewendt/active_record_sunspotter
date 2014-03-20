source 'https://rubygems.org'
#source "http://gemcutter.org"
#source "http://gems.github.com"

#	This may be a bit much, but leaving here for now.
#gem 'rails', '~> 3'
#gem 'activerecord', '~> 3'
#gem 'actionpack', '~> 3'

#	2.1.0 doesn't seem to actually start
#gem 'sunspot', '= 2.0.0'
#	20140117 - Stick with java 1.6.  java 1.7 causes grief.
#	lots of seemingly random ...   EOFError: end of file reached
#	I don't even know what file it is refering to
#	Fortunately, this seems to only be a testing error as our production site
#	is using 1.7 apparently without issue.
# And dev with 1.7 ok too, I think.  Just "test"
#
#	Manipulated current version with links in ....
#	/System/Library/Frameworks/JavaVM.framework/Versions
#
#	Upgrading the sunspot family to 2.1.0 will cause ...
#> bundle exec rake sunspot:solr:run
#java.lang.reflect.InvocationTargetException
#	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
#	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:57)
#	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
#	at java.lang.reflect.Method.invoke(Method.java:606)
#	at org.eclipse.jetty.start.Main.invokeMain(Main.java:472)
#	at org.eclipse.jetty.start.Main.start(Main.java:620)
#	at org.eclipse.jetty.start.Main.main(Main.java:95)
#Caused by: java.lang.NoSuchMethodError: org.slf4j.helpers.MessageFormatter.arrayFormat(Ljava/lang/String;[Ljava/lang/Object;)Lorg/slf4j/helpers/FormattingTuple;
#	at org.eclipse.jetty.util.log.JettyAwareLogger.log(JettyAwareLogger.java:619)
#	at org.eclipse.jetty.util.log.JettyAwareLogger.debug(JettyAwareLogger.java:206)
#	at org.eclipse.jetty.util.log.Slf4jLog.debug(Slf4jLog.java:89)
#	at org.eclipse.jetty.xml.XmlConfiguration$1.run(XmlConfiguration.java:1203)
#	at java.security.AccessController.doPrivileged(Native Method)
#	at org.eclipse.jetty.xml.XmlConfiguration.main(XmlConfiguration.java:1189)
#	... 7 more
#
#Usage: java -jar start.jar [options] [properties] [configs]
#       java -jar start.jar --help  # for more information
#
#	and doesn't start.
#
gem 'sunspot_rails', '= 2.0.0'
gem 'sunspot_solr', '= 2.0.0' # optional pre-packaged Solr distribution for use in development
gem 'progress_bar'
gem 'will_paginate'


#	A bit confused.  In an app, if I were to specify the above in the Gemfile, Sunspot 
#	will be defined.  However, when the Gemfile has a gem which requires sunspot, 
#	Sunspot is NOT defined.  require 'sunspot_rails' must be explicitly called?
#	Perhaps a Railtie should be used?





group :development, :test do
	# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
	gem 'rails', '~> 4.0'

	# Use sqlite3 as the database for Active Record
	gem 'sqlite3'

	# Use SCSS for stylesheets
	gem 'sass-rails', '~> 4.0.2'

	# Use Uglifier as compressor for JavaScript assets
	gem 'uglifier', '>= 1.3.0'

	# Use CoffeeScript for .js.coffee assets and views
	#gem 'coffee-rails', '~> 4.0.0'

	# See https://github.com/sstephenson/execjs#readme for more supported runtimes
	# gem 'therubyracer', platforms: :ruby

	# Use jquery as the JavaScript library
	#gem 'jquery-rails'

	# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
	gem 'turbolinks'

	# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
	gem 'jbuilder', '~> 1.2'

	#       ruby 1.9.3 requirement to parse american date
	#       format Month/Day/Year Date.parse('12/31/2000')
	gem 'american_date'

	gem "acts_as_list"

	gem "jeweler"
	#gem "hpricot"

end


group :test do
	gem "simplecov", :require => false

	gem "jakewendt-html_test"

	gem 'test-unit'

	gem "factory_girl_rails"

	gem "mocha", :require => false

	gem "autotest-rails", :require => 'autotest/rails'

	gem 'ZenTest'

	gem 'jakewendt-test_with_verbosity'
end
