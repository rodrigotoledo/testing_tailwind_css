Rails.application.routes.draw do
  resources :live_movies
  resources :artists
  devise_for :users
  resources :movies
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'movies#index'
end
