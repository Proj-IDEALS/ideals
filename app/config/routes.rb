Rails.application.routes.draw do
  root :to => 'application#index'
  resources :newobjects
  resources :map
end
