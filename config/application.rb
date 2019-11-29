# frozen_string_literal: true

require_relative 'boot'
require 'kaminari'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module InvestPortal
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    config.load_defaults 5.2

    config.time_zone = 'Kyiv'
    config.i18n.enforce_available_locales = true
    config.i18n.default_locale = :uk
    config.i18n.available_locales = %i[uk en]
    config.i18n.fallbacks = true
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.autoload_paths << Rails.root.join('lib')
    config.autoload_paths += %W[#{config.root}/app/models/ckeditor]
    config.autoload_paths += %W[#{config.root}/app/serializers]
    config.autoload_paths += %W[#{config.root}/lib/**/]
  end
end
