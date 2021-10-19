Rails.application.routes.draw do
  resources :lobbies
  resources :users
  resources :leaderboards, only: :index
  resources :admin
  root "users#index"
end
