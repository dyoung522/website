Rails.application.routes.draw do
  resources :sessions
  resources :users

  get 'log_in' => 'sessions#new'
  get 'log_out' => 'sessions#destroy'

  root 'home#index'
end
