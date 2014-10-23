Rails.application.routes.draw do
  resources :sessions
  resources :users

  get 'log_in' => 'sessions#new'

  root 'home#index'
end
