# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }
  root 'tests#index'

  resources :tests, only: :index do
    member do
      post :begin
    end
  end

  resources :results, only: %i[show update] do
    member do
      get :attempt
    end
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, expect: :index
      end
    end
  end
end
