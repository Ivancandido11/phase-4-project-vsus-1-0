class User < ApplicationRecord
  before_save { self.username = username.downcase }

  has_one :user_in_lobby
  has_one :lobby, through: :user_in_lobby

  has_one_attached :avatar

  validates_presence_of :username, :password_digest, :email
  validates :username, uniqueness: true
  validates :email, uniqueness: true

  has_secure_password

  # helper_method :admin?

private

  def admin?
    return true if admin == true
  end

end
