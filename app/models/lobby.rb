class Lobby < ApplicationRecord
  has_many :user_in_lobbies
  has_many :users, through: :user_in_lobbies

  validates_presence_of :name
  validate :max_four_players

private

  def max_four_players
    error.add(:base, "#{name} is full.") if user_in_lobbies.size == 4
  end
end
