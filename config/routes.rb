# frozen_string_literal: true

Rails.application.routes.draw do
  get 'abouts/index'
  get 'about/index'
  get 'users/show'
  get 'about', to: 'abouts#index'
  devise_for :users
  root to: 'events#index'
  resources :users, only: [:show]
  resources :events, only: [:index, :new, :create]
  resources :abouts, only: [:index]
end
