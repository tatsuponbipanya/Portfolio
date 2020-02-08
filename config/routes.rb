Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  get 'sessions/new'
  get 'users/new'

  root 'static_pages#home'
  get    '/home',     to: 'static_pages#home'
  get    '/help',     to: 'static_pages#help'
  get    '/about',    to: 'static_pages#about'
  get    '/contact',  to: 'static_pages#contact'
  get    '/index',    to: 'maps#index'
  get    '/search',   to: 'goods#search'
  get    '/signup',   to: 'users#new'
  get    '/login',    to: 'sessions#new'
  post   '/login',    to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'
  resources :likes, only: [:create, :destroy]
  resources :testsessions, only: :create
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end
