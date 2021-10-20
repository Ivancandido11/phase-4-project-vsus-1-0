Rails.application.routes.draw do
  resource :user_in_lobbies, only: :create
  resources :lobbies
  resources :users
  resources :leaderboards, only: :index
  resources :admin
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  post "logout", to: "sessions#destroy"
  root "home#index"
end
