# frozen_string_literal: true

Rails.application.routes.draw do
  resources :theories
  resources :assumptions
  resources :practices

  root 'map#index'

  # User Login
  get '/auth/auth0/callback' => 'auth0#callback'
  get '/auth/failure' => 'auth0#failure'
  get '/auth/logout' => 'auth0#logout'
  get '/user/info' => 'user#show'
  if Rails.env.test?
    get 'test', to: 'test#index'
    namespace :test do
      resource :session, only: %i[create]
    end
  end

  # Concept Map
  get '/init' => 'main#index'
  get '/api/v1/map' => 'map#all'
end
