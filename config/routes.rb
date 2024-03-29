Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :tweets, only: :create do
    resources :likes, only: [:create, :destroy]
  end

  get :dashboard, to: 'dashboard#index'

  resource :username, only: [:new, :update]
end
