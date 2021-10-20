class UsersController < ApplicationController
  before_action :require_login, only: :show

  def show
    find_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      @user.avatar.attach(params[:user][:avatar])
      session[:user_id] = @user.id
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
    find_user
  end

  def update
    find_user
    @user.update(user_params)

    if @user.valid?
      redirect_to @user
    else
      render :edit
    end
  end

private

  def find_user
    @user = Current.user
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
