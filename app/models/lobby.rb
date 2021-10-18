class Lobby < ApplicationRecord
  has_many :user_in_lobbies
  has_many :users, through: :user_in_lobbies

  validates_presence_of :name
end
