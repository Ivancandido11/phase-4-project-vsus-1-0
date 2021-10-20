class UserInLobby < ApplicationRecord
  belongs_to :user
  belongs_to :lobby

  validate :max_four_players
  validate :update_full_lobby
  validate :player_can_only_be_in_one_game_at_a_time

private

  def update_full_lobby
    lobby.update(is_full: true) if lobby.user_in_lobbies.size == 3
  end

  def max_four_players
    errors.add(:base, "#{lobby.name} is full.") if lobby.is_full
  end

  def player_can_only_be_in_one_game_at_a_time
    errors.add(:base, "You are already in a game.") if UserInLobby.find_by(user_id: user.id)
  end
end
