Rails.application.routes.draw do
  devise_for :users
  root 'suppliers#index'
end
