Rails.application.routes.draw do
<<<<<<< HEAD
  resources :newobjects

=======
>>>>>>> 7b45c824 (Auto-generated interfaces for each model)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :theories
  resources :assumptions
  resources :practices

  # Defines the root path route ("/")
  # root "articles#index"

  #User Login
  get '/auth/auth0/callback' => 'auth0#callback'
  get '/auth/failure' => 'auth0#failure'
  get '/auth/logout' => 'auth0#logout'

end
