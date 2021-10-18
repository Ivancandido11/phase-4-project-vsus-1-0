class UsersController < ApplicationController
  def index
    @users = User.all.limit(3)
  end
end
