Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :users, only: [:index, :show, :edit, :update]

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

end
