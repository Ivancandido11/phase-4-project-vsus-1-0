class LeaderboardsController < ApplicationController
  def index
    @users = User.order(points: :desc).limit(25)
  end
end
