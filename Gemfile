source 'https://rubygems.org'

gem 'sunspot_rails'
gem 'sunspot_solr'
gem 'progress_bar'
gem 'will_paginate'


#	A bit confused.  In an app, if I were to specify the above in the Gemfile, Sunspot 
#	will be defined.  However, when the Gemfile has a gem which requires sunspot, 
#	Sunspot is NOT defined.  require 'sunspot_rails' must be explicitly called?
#	Perhaps a Railtie should be used?


group :development, :test do
	# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
	gem 'rails'	#, '~> 4.0'

	# Use sqlite3 as the database for Active Record
	gem 'sqlite3'

	# Use SCSS for stylesheets
	gem 'sass-rails'	#, '~> 4.0.2'

	# Use Uglifier as compressor for JavaScript assets
	gem 'uglifier'	#, '>= 1.3.0'

	# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
#	gem 'turbolinks'

	# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
#	gem 'jbuilder', '~> 1.2'

	#       ruby 1.9.3 requirement to parse american date
	#       format Month/Day/Year Date.parse('12/31/2000')
	gem 'american_date'

	gem "acts_as_list"

	gem "jeweler"

end


group :test do
	gem "simplecov", :require => false

	gem "jakewendt-html_test"

	gem 'test-unit'

	gem "factory_girl_rails"

	gem "mocha", :require => 'mocha/setup'

	gem "autotest-rails", :require => 'autotest/rails'

	gem 'ZenTest'

	gem 'jakewendt-test_with_verbosity'
end
