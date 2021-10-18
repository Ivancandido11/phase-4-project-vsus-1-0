Rails.application.routes.draw do
  resources :lobbies
  resources :users
  resources :leaderboards, only: :index
  root "users#index"
end
