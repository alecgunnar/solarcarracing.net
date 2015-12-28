require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SolarcarracingNet
  class Application < Rails::Application
    VERSION_MAJOR   = '1'
    VERSION_MINOR   = '0'
    VERSION_RELEASE = '0'
    VERSION_NAME    = 'DEV'

    config.version                                        = VERSION_MAJOR + '.' + VERSION_MINOR + '.' + VERSION_RELEASE + (VERSION_NAME ? ' ' + VERSION_NAME : '')
    config.time_zone                                      = 'Eastern Time (US & Canada)'
    config.active_record.raise_in_transactional_callbacks = true
  end
end
