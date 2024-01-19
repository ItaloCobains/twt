Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resource :tweets, only: [:create]
end
