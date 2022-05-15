Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'

  resources :users, only: %i[show index]
  resources :books, only: %i[show index]
  resources :authors, only: %i[show index]
  resources :genres, only: :show
end
