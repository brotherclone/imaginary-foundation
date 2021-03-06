Rails.application.routes.draw do

  resources :related_links

  resources :promo_cards

  resources :pull_quotes

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
  get 'style-guide', :to => redirect('/assets/styleguide.html')


end
