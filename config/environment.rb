require 'yaml'

# Load the Rails application.
require File.expand_path('../application', __FILE__)

if File.exists?('config/private.yml')
    PRIVATE = YAML.load('config/private.yml')
end

# Initialize the Rails application.
Rails.application.initialize!
