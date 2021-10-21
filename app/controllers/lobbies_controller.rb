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

  def destroy
    find_lobby
    winners = @lobby.users.sample(2)
    winners[0].increment!(:points, 10)
    winners[1].increment!(:points, 5)
    @lobby.destroy
    redirect_to lobbies_url, flash: {
      success: "#{winners[0].username} earned 10 points for winning!
        and #{winners[1].username} earned 5 points for second place!",
    }
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
