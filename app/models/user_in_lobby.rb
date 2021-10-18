class UserInLobby < ApplicationRecord
  belongs_to :user
  belongs_to :lobby

  validate :max_four_players

private

  def max_four_players
    errors.add(:base, "#{lobby.name} is full.") if lobby.user_in_lobbies.size == 4
  end
end
