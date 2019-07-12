Rails.application.routes.draw do
  resources :websites, only: %i[new index create]
  root 'websites#new'
end