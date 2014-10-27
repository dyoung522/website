Rails.application.routes.draw do
  resources :sessions, only: [ :new, :create, :destroy ]
  resources :users

  get 'admin/log_in',  to: 'sessions#new'
  get 'admin/log_out', to: 'sessions#destroy'

  root 'home#index'
end
