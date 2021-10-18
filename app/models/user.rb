class User < ApplicationRecord
  has_one :user_in_lobby

  validates_presence_of :username, :password_digest, :email
  validates :username, uniqueness: true
  validates :email, uniqueness: true
end
