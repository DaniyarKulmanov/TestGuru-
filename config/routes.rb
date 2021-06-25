# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tests#index'

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  delete :logout, to: 'sessions#destroy'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, expect: :index
    end
    member do
      post :begin
    end
  end

  resources :results, only: %i[show update] do
    member do
      get :attempt
    end
  end
end
