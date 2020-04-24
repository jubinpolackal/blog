# frozen_string_literal: true

Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcome/about'
  root 'welcome#index'
  resources :articles do
    resources :comments
  end

  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :categories, except: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
