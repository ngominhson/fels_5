Fels5::Application.routes.draw do
  resources :users
  resources :categories
  resources :sessions, only: [:new, :create, :destroy]
  root "static_pages#home"
  match "/help", to: "static_pages#help", via: "get"
  match "/about", to: "static_pages#about", via: "get"
  match "/contact", to: "static_pages#contact", via: "get" 
  match "/signin",  to: "sessions#new",         via: "get"
  match "/signout", to: "sessions#destroy",     via: "delete"
  namespace :admin do
    match "/signin", to: "sessions#new", via: "get"
    match "/signout", to: "sessions#destroy", via: "delete"
    resources "sessions", only: [:new, :create, :destroy]
    resources "users"
  end
end
