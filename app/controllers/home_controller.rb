class HomeController < ApplicationController
  def index
    @user = User.find(session[:user_id]) if session[:user_id]

    @users = User.all.limit(3)
  end
end
