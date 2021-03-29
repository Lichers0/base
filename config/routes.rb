Rails.application.routes.draw do
  # get 'accounts/index'
  devise_for :users
  resources :suppliers
  resources :accounts
  root 'suppliers#index'
end
