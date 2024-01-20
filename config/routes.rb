Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resource :tweets, only: [:create]

  get :dashboard, to: 'dashboard#index'

  resource :username, only: [:new, :update]
end
