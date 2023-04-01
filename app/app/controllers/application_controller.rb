class ApplicationController < ActionController::Base
  # GET /
  def index
  end

  private
# :nocov:

  def require_login
    unless session[:userinfo].present?
      flash[:alert] = "Log in is required. You do not have rights to perform that action. If you believe you have the rights, please log in with your account."
      redirect_to root_path and return
    end
  end
# :nocov:


end
