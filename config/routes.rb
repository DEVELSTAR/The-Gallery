Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :users, only: [:index, :show, :edit, :update]

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  resources :likes, only: [:create, :destroy]

  post '/users/:id/follow', to: "users#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"

end
