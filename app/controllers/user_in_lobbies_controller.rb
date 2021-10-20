class UserInLobbiesController < ApplicationController
  def create
    UserInLobby.create(user_in_lobby_params)
    lobby = Lobby.find(params[:user_in_lobby][:lobby_id])
    redirect_to lobby
  end

private

  def user_in_lobby_params
    params.require(:user_in_lobby).permit(:lobby_id, :user_id)
  end
end
