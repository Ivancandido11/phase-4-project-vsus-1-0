class User < ApplicationRecord
  before_save { self.username = username.downcase }

  has_one :user_in_lobby
  has_one :lobby, through: :user_in_lobby
  has_many :lobbies, foreign_key: :host_id

  has_one_attached :avatar

  validates_presence_of :username, :password_digest, :email
  validates :username, uniqueness: true
  validates :email, uniqueness: true

  has_secure_password
end
