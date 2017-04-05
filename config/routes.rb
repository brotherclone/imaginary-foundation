Rails.application.routes.draw do

  resources :promo_cards

  resources :gallery_images

  resources :pull_quotes

  resources :galleries

  resources :images

  resources :goodwords

  resources :essays

  resources :projects

  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  root 'home#index'
  get 'resume' => 'resume#index'
  get 'records' => 'records#index'
  get 'home' => 'home#index'
  get 'about' => 'about#index'
  get 'privacy' => 'privacy#index'
  get 'contact' => 'contact#index'
  get 'related-sites' => 'related_sites#index'


end
