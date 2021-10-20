class LobbiesController < ApplicationController
  before_action :require_login

  helper_method :in_lobby?

  def index
    @lobbies = Lobby.all
    @user_in_lobby = UserInLobby.new
  end

  def show
    @lobby = Lobby.find(params[:id])
    @players = @lobby.user_in_lobbies.map(&:user)
  end

  def new
    @lobby = Lobby.new
    redirect_to lobbies_url if in_lobby?
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
  end

private

  def lobby_params
    params.require(:lobby).permit(:name)
  end
end
