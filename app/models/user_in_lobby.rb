require "pry"

class UserInLobby < ApplicationRecord
  belongs_to :user
  belongs_to :lobby

  validate :max_four_players
  validate :update_full_lobby

private

  def update_full_lobby
    lobby.update(is_full: true) if lobby.user_in_lobbies.size == 3
  end

  def max_four_players
    errors.add(:base, "#{lobby.name} is full.") if lobby.is_full
  end
end
