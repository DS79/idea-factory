Rails.application.routes.draw do
  

  devise_for :users
  resources :ideas do
    resources :comments
    resources :joins, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end

  
  root 'ideas#index'

  
end