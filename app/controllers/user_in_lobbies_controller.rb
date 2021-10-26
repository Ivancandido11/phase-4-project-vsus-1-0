class UserInLobbiesController < ApplicationController
  def create
    @joined = UserInLobby.create(user_in_lobby_params)
    if @joined.persisted?
      redirect_to @joined.lobby
    else
      redirect_to lobbies_path, flash: { error: @joined.errors.errors.first.type }
    end
  end

private

  def user_in_lobby_params
    params.require(:user_in_lobby).permit(:lobby_id, :user_id)
  end
end
