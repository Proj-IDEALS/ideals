require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    config.load_defaults 7.0
    config.log_level = :debug
    config.log_tags  = [:subdomain, :uuid]
    config.assets.paths << Rails.root.join('node_modules')
  end
end
