Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "admins/sessions", registrations: "admins/registrations" }
  root to: 'requests#is_user_login'
  resources :requests
  resources :searches
  resources :slas, only: [:new, :create]
  resources :departments, only: [:new, :create]
  get 'settings', to: 'settings#show'
  get 'add_newuser', to: 'settings#add_newuser'
  
end
