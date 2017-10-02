Rails.application.routes.draw do
  resources :users
  resources :rides
  resources :attractions
  resources :sessions
  root 'welcome#index'
  get '/signin', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  end
