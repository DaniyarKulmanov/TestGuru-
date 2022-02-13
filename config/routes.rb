# frozen_string_literal: true

Rails.application.routes.draw do
  get 'badges/index'
  devise_for :users, path: :gurus,
                     path_names: { sign_in: :login, sign_out: :logout },
                     controllers: { sessions: 'users/sessions',
                                    registrations: 'users/registrations',
                                    passwords: 'users/passwords' }
  root 'tests#index'

  resources :feedbacks, only: %i[new create]

  resources :tests, only: :index do
    member do
      post :begin
    end
  end

  resources :results, only: %i[show update] do
    resources :gists, only: :create
    member do
      get :attempt
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, expect: :index
      end
      member do
        post :begin, to: 'tests#begin'
      end
    end
    resources :gists, only: %i[index destroy]
  end
  
  resources :badges, only: :index
end
