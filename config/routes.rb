# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tests#index'

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, expect: :index
    end
  end

  resources :results, only: %i[show update] do
    member do
      get :attempt
    end
  end
end
