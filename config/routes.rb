# frozen_string_literal: true

Rails.application.routes.draw do
  get 'tests/show'
  root 'tests#index'

  resources :tests do
    resources :questions, shallow: true
  end
end
