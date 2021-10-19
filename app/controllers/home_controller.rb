class HomeController < ApplicationController
  def index
    @user = Current.user

    @users = User.all.limit(3)
  end
end
