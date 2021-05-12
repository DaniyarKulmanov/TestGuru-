# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tests#index'

  resources :tests
end
