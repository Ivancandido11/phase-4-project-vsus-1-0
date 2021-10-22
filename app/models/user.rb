class User < ApplicationRecord
  before_save { self.email = email.downcase }

  has_one :user_in_lobby
  has_one :lobby, through: :user_in_lobby
  has_many :lobbies, foreign_key: :host_id

  has_one_attached :avatar

  validates_presence_of :username, :password_digest, :email
  validates_uniqueness_of :username, case_sensitive: false
  validates_uniqueness_of :email, case_sensitive: false

  has_secure_password
end
