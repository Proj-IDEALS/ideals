# ./app/controllers/user_controller.rb
class UserController < ApplicationController
    include Secured
  # :nocov:

    def show
      # session[:userinfo] was saved earlier on Auth0Controller#callback
      @user = session[:userinfo]
      @provider = session[:provider]
      @uid = session[:uid]
      @info = session[:info]
      render 'user/show'
    end
  # :nocov:

  end