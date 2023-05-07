# frozen_string_literal: true

require 'yaml'
require 'selenium/webdriver'
require 'capybara/cucumber'
require 'browserstack/local'

# monkey patch to avoid reset sessions
module Capybara
  module Selenium
    class Driver < Capybara::Driver::Base
      def reset!
        @browser&.navigate&.to('about:blank')
      end
    end
  end
end

Capybara.register_driver :browserstack do |app|
  # rubocop:disable Lint/ConstantDefinitionInBlock
  USER_NAME = ENV['BROWSERSTACK_USERNAME']
  ACCESS_KEY = ENV['BROWSERSTACK_ACCESS_KEY']
  # rubocop:enable Lint/ConstantDefinitionInBlock

  # Creates an instance of Local
  bs_local = BrowserStack::Local.new

  # You can also set an environment variable - "BROWSERSTACK_ACCESS_KEY".
  bs_local_args = { 'key' => ACCESS_KEY, 'force' => 'true' }

  # Starts the Local instance with the required arguments
  bs_local.start(bs_local_args)

  # Check if BrowserStack local instance is running
  puts bs_local.isRunning
  # Input capabilities
  options = Selenium::WebDriver::Options.chrome
  options.browser_version = 'latest'
  options.platform_name = 'MAC'
  bstack_options = {
    'os' => 'OS X',
    'osVersion' => 'Sierra',
    'buildName' => 'IDEALS Project Test',
    'sessionName' => 'Selenium-4 Ruby test',
    'local' => 'true',
    'seleniumVersion' => '4.0.0'
  }

  options.add_option('bstack:options', bstack_options)
  Capybara::Selenium::Driver.new(app,
                                 browser: :remote,
                                 url: "https://#{USER_NAME}:#{ACCESS_KEY}@hub-cloud.browserstack.com/wd/hub",
                                 # desired_capabilities: @caps,
                                 capabilities: options)
end

Before('@selenium') do
  Capybara.current_driver = :browserstack
end

After('@selenium') do
  Capybara.use_default_driver
end

# Code to stop browserstack local after end of test
at_exit do
  @bs_local&.stop
end
