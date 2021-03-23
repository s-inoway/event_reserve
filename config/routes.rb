# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'events#index'
  resources :users, only: [:show]
  resources :events, only: [:index, :new]
end
