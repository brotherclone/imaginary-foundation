Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  resources :images

  resources :projects

  resources :essays

  root 'home#index'

  get 'resume' => 'resume#index'
  get 'home' => 'home#index'
  get 'about' => 'about#index'
  get 'privacy' => 'privacy#index'
  get 'contact' => 'contact#index'
  get 'related_sites' => 'related_sites#index'

end
