Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :theories
  resources :assumptions
  resources :practices

  # Defines the root path route ("/")
  root "main#index"
end
