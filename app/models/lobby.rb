class Lobby < ApplicationRecord
  has_many :user_in_lobbies, dependent: :destroy
  has_many :users, through: :user_in_lobbies
  belongs_to :host, class_name: "User"

  validates_presence_of :name
  validates :name, uniqueness: true

  accepts_nested_attributes_for :user_in_lobbies

  def find_winners
    return if is_full == false

    winners = users.sample(2)
    winners[0].increment!(:points, 10)
    winners[1].increment!(:points, 5)
    @message = "#{winners[0].username} earned 10 points for winning!
        and #{winners[1].username} earned 5 points for second place!"
  end
end
