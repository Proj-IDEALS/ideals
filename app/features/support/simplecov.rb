# frozen_string_literal: true

require 'simplecov'
SimpleCov.start 'rails'

SimpleCov.start do
  add_filter 'app/controllers/main_controller.rb'
  #add_filter 'app/controllers/auth0_controller.rb'
  add_filter 'app/helpers'
  add_filter 'app/controllers/user_controller.rb'
  add_filter 'app/controllers/concerns/secured.rb'
end
