class UsersController < ApplicationController
  def index
    @users = User.all.limit(3)
  end

  def show
    find_user
  end

private

  def find_user
    @user = User.find(session[user.id])
  end
end
