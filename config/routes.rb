Rails.application.routes.draw do

  mount Kss::Engine => '/kss' if Rails.env.development?
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  resources :tags

  resources :topics

  resources :images

  resources :projects

  resources :essays

  root 'home#index'

  get 'resume' => 'resume#index'
  get 'home' => 'home#index'
  get 'about' => 'about#index'

end
