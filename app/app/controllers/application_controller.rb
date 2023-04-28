# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # GET /
  def index; end

  private

  # :nocov:

  def require_login
    # if ENV['CUCUMBER'] is true, then return

    return if ENV['CUCUMBER_Skip_Auth'] == 'true'

    return if session[:userinfo].present?

    flash[:alert] =
      'Log in is required. You do not have rights to perform that action. If you believe you have the rights, please log in with your account.'
    redirect_to '/init' and return
  end
  # :nocov:
end
