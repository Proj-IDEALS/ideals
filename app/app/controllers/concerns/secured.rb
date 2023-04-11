# frozen_string_literal: true

module Secured
  extend ActiveSupport::Concern

  included do
    before_action :logged_in_using_omniauth?
  end

  def logged_in_using_omniauth?
    flash[:alert] =
      'Log in is required. You do not have rights to perform that action. If you believe you have the rights, please log in with your account.'
    redirect_to '/' unless session[:userinfo].present?
  end
end
