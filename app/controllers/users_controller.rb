class UsersController < ApplicationController
  def show
    find_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      @user.avatar.attach(params[:avatar])
      session[:user_id] = @user.id
      redirect_to root_url
    else
      render :new
    end
  end

private

  def find_user
    @user = User.find(session[user.id])
  end

  def user_params
    params.require(:user).permit(
      :username,
      :password,
      :password_confirmation,
      :avatar,
      :email
    )
  end
end
