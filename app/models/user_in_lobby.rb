class UserInLobby < ApplicationRecord
  belongs_to :user
  belongs_to :lobby

  validate :max_four_players
  validate :validate_host
  validates :user, uniqueness: { message: "You are already in a game" }

  before_create :calculate_avg_points

  def calculate_avg_points
    unless lobby.users.size.zero?
      average = lobby.users.sum(:points) / lobby.users.size.to_f
      lobby.update(avg_points: average)
    end
  end

private

  def validate_host
    return if lobby.host

    lobby.update(host: user)
  end

  def max_four_players
    errors.add(:base, "#{lobby.name} is full.") if lobby.is_full

    lobby.update(is_full: true) if lobby.user_in_lobbies.size == 4
  end
end
