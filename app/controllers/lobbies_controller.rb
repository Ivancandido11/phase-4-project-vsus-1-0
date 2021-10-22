class LobbiesController < ApplicationController
  before_action :require_login

  helper_method :in_lobby?

  def index
    @lobbies = Lobby.all
    @user_in_lobby = UserInLobby.new
  end

  def show
    find_lobby
    @players = @lobby.user_in_lobbies.map(&:user)
    @user_in_lobby = UserInLobby.new
  end

  def new
    @lobby = Lobby.new
    redirect_to lobbies_url if in_lobby?
  end

  def create
    @lobby = Lobby.new(lobby_params)
    @joined = UserInLobby.new(user: Current.user, lobby: @lobby)

    if @lobby.save && @joined.save
      @joined.calculate_avg_points
      redirect_to @lobby
    else
      render :new
    end
  end

  def destroy
    find_lobby
    message = @lobby.find_winners
    @lobby.destroy
    redirect_to @lobby, flash: { success: message }
  end

  def in_lobby?
    @in_lobby = UserInLobby.find_by(user: Current.user)
  end

private

  def find_lobby
    @lobby = Lobby.find(params[:id])
  end

  def lobby_params
    params.require(:lobby).permit(:name, :host_id)
  end
end
