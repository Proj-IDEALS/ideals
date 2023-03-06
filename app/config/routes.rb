Rails.application.routes.draw do
  root :to => 'application#index'
  resources :newobjects

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #User Login
  get '/auth/auth0/callback' => 'auth0#callback'
  get '/auth/failure' => 'auth0#failure'
  get '/auth/logout' => 'auth0#logout'

  #Concept Map
  get '/api/v1/map' => 'map#all'

end
