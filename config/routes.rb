Rails.application.routes.draw do
  post '/items/:id', to: "carts#create"
  resources :items
  devise_for :users
  resources :carts
  resources :orders, only: [:create]
  root 'home#index'
  get "home/about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
