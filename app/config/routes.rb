Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :theories
  resources :assumptions
  resources :practices

  # Defines the root path route ("/")
   # root "articles#index"
  root "main#index"
  
  #User Login
  get '/auth/auth0/callback' => 'auth0#callback'
  get '/auth/failure' => 'auth0#failure'
  get '/auth/logout' => 'auth0#logout'

end
