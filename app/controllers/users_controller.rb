class UsersController < ApplicationController
  def show
    find_user
  end

private

  def find_user
    @user = User.find(session[user.id])
  end
end
