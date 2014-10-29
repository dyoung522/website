Rails.application.routes.draw do
  resources :sessions, only: [ :new, :create, :destroy ]

  get 'admin/log_in',  to: 'sessions#new'
  get 'admin/log_out', to: 'sessions#destroy'

  resources :projects do
    resources :posts do
      resources :comments
    end
  end

  root 'home#index'
end
