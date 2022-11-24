# frozen_string_literal: true
Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index] do
    resources :groups, only: [:index, :show, :new, :create, :destroy]
    resources :records
  end

  authenticated :user do
    root :to => 'groups#index', as: :authenticated_root
  end

  # Defines the root path route ("/")
  root to: 'splashes#index' 
end