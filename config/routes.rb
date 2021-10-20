Rails.application.routes.draw do
  resource :user_in_lobbies, only: :create
  resources :lobbies, only: %i[index show new create destroy]
  resources :users, only: %i[show new create edit update]
  resources :leaderboards, only: :index
  resources :admin, only: :index
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  post "logout", to: "sessions#destroy"
  root "home#index"
end
