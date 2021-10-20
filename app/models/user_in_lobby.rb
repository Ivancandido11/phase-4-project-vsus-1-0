class UserInLobby < ApplicationRecord
  belongs_to :user
  belongs_to :lobby

  validate :max_four_players
  validate :validate_host
  validate :player_can_only_be_in_one_game_at_a_time

private

  def validate_host
    return if lobby.host

    lobby.update(host: user)
  end

  def max_four_players
    errors.add(:base, "#{lobby.name} is full.") if lobby.is_full

    lobby.update(is_full: true) if lobby.user_in_lobbies.size == 4
  end

  def player_can_only_be_in_one_game_at_a_time
    errors.add(:base, "You are already in a game.") if UserInLobby.where(user_id: user.id).size > 1
  end
end
