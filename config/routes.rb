Rails.application.routes.draw do
  get 'messages/new'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  resources :items do
    resources :orders, only: [:create, :index]
  end
  resources :messages, only: [:new, :create]
end
