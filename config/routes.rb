Rails.application.routes.draw do
  devise_for :users
  root to: 'homepage#index'
  resources :homepage, only: [:index]
  resources :users, only: [:show, :edit, :update], :path => 'my_profile' do
    resources :avatars, only: [:show, :edit, :update]
  end
  resources :real_estates do
    resources :chatroom, only: [:index, :create]
  end
  resources :charges, only: [:new, :create], :path => 'checkout'
  resources :house_coins, only: [:create, :update, :destroy]
  resources :carts, only: [:index, :destroy], :path => 'my_cart'

  namespace :admin do
    resources :real_estates
  end

  resources :subscribers, only: [:create]

  # static pages
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/team', to: 'static_pages#team', via: 'get'
  match '/terms', to: 'static_pages#terms', via: 'get'
  match '/privacy_policy', to: 'static_pages#privacy_policy', via: 'get'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
