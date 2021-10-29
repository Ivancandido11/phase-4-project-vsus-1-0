require 'rails_helper'

RSpec.describe LeaderboardsController, type: :controller do
  describe "GET /index" do
    it "grabs the top 25 users based on points" do
      user = create(:user)
      create_users
      users = User.order(points: :desc).limit(25)

      get :index

      expect(assigns[:users]).not_to include(user)
      expect(assigns[:users]).to eq users
    end

    it "renders the index template" do
      get :index
      
      expect(response).to render_template("index")
    end
  end

  def create_users
    40.times do
      create(:user, username: Faker::Name.unique.name, email: Faker::Internet.unique.email, points: rand(10..80))
    end
  end
end
