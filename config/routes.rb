Rails.application.routes.draw do
  devise_for :users
  root to: 'real_estates#index'
  #resource :users, only: [:show], path: '/mon_profil'   
  resources :users, only: [:show, :edit,:update]
  resources :real_estates
  resources :charges, only: [:new, :create]
  # static pages
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/team', to: 'static_pages#team', via: 'get'
  match '/cgv', to: 'static_pages#cgv', via: 'get'
  match '/privacy_policy', to: 'static_pages#privacy_policy', via: 'get'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
