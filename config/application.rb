require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Sunspotter
	class Application < Rails::Application
		# Settings in config/environments/* take precedence over those specified here.
		# Application configuration should go into files in config/initializers
		# -- all .rb files in that directory are automatically loaded.

		# Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
		# Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
		# config.time_zone = 'Central Time (US & Canada)'

		# The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
		# config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
		# config.i18n.default_locale = :de




#	I followed instructions to secrets.yml, but app doesn't actually read it?
#	I will probably have to removing the following line when 4.1 is used.
#	http://stackoverflow.com/questions/21136363/using-config-secrets-yml-in-rails-4-0-2-version
#	https://github.com/rails/rails/pull/13298
config.secret_key_base = YAML.load(File.open("#{Rails.root}/config/secrets.yml"))[Rails.env]['secret_key_base']



	end
end
