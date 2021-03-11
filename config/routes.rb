Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'events#index'
  resources :users, only: [:show]
  resources :events, only: %i[index new]
end
