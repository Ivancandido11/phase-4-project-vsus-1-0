class LobbiesController < ApplicationController
  before_action :require_login

  def index
    @lobbies = Lobby.all
    @user_in_lobby = UserInLobby.new
  end

  def show; end
end
