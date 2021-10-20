class LobbiesController < ApplicationController
  before_action :require_login
  before_action :in_lobby?, only: %i[new create]

  helper_method :in_lobby?

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
      render :new
    end
  end

  def in_lobby?
    @in_lobby = UserInLobby.find_by(user: Current.user)
    redirect_to @in_lobby.lobby if @in_lobby
  end

private

  def lobby_params
    params.require(:lobby).permit(:name)
  end
end
