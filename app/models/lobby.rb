class Lobby < ApplicationRecord
  has_many :user_in_lobbies
  has_many :users, through: :user_in_lobbies
  belongs_to :host, class_name: "User"

  validates_presence_of :name
  validates :name, uniqueness: true

  accepts_nested_attributes_for :user_in_lobbies
end
