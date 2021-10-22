class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:email].downcase)

    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_url
    elsif @user
      redirect_to login_url, flash: { error: "Invalid password" }
    else
      redirect_to login_url, flash: { error: "Invalid email or password" }
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_url
  end
end
