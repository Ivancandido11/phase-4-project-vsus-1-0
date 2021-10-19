Rails.application.routes.draw do
  devise_for :players
  resources :lobbies
  resources :users
  resources :leaderboards, only: :index
  resources :admin
  root "home#index"
end
