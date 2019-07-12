Rails.application.routes.draw do
  resources :websites
  root 'websites#index'
end