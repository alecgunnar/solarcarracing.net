require 'yaml'

# Load the Rails application.
require File.expand_path('../application', __FILE__)

PRIVATE_CONFIG_FILE = "#{Rails.root.to_s}/config/private.yml";

unless File.exists?(PRIVATE_CONFIG_FILE)
    puts 'The private configuration file does not exist... Run `bin/setup` to create it!'
    exit
end

PRIVATE = YAML.load_file(PRIVATE_CONFIG_FILE)

# Initialize the Rails application.
Rails.application.initialize!
