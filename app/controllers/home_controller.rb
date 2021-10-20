class HomeController < ApplicationController
  def index
    @user = Current.user

    @users = User.order(points: :desc).limit(3)
    @lobbies = Lobby.last(5)
  end
end
