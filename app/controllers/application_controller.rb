class ApplicationController < ActionController::Base
  before_action :set_current_user
  include ActionController::Cookies

  def set_current_user
    Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_login
    redirect_to login_url, flash: { error: "Must be logged in!" } unless session.include? :user_id
  end

  def require_admin
    if !require_login && !Current.user.admin
      redirect_to root_url, flash: { error: "You do not have access to this page!" }
    end
  end
end
