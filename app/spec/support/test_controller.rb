# frozen_string_literal: true

# spec/support/test_controller.rb
class TestController < ApplicationController
  include Secured

  def index
    render plain: 'Test controller index action'
  end
end
