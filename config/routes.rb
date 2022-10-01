Rails.application.routes.draw do
  resources :posts
  devise_for :users
  root 'home#index'

  resources :users, only: [:index, :show]


end
