class LobbiesController < ApplicationController
  before_action :require_login

  def index
    @lobbies = Lobby.all
    @user_in_lobby = UserInLobby.new
  end

  def show; end

  def new
    @lobby = Lobby.new
  end

  def create
    @lobby = Lobby.new(lobby_params)
    @joined = UserInLobby.new(user: Current.user, lobby: @lobby)

    if @lobby.save && @joined.save
      redirect_to @lobby
    else
      byebug
      render :new
    end
  end

private

  def lobby_params
    params.require(:lobby).permit(:name)
  end
end
