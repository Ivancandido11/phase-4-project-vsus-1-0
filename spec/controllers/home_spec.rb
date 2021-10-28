require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "GET /index" do
    it "grabs the current user" do
      user = Current.user

      get :index

      expect(assigns[:user]).to eq user
    end

    it "grabs top 3 users in points" do
      create_users
      users = User.order(points: :desc).limit(3)

      get :index

      expect(assigns[:users]).to eq users
    end

    it "grabs the last 5 created lobbies" do
      create_lobbies
      lobbies = Lobby.last(5)
      first_lobby = Lobby.first
      
      get :index

      expect(assigns[:lobbies]).not_to include(first_lobby)
      expect(assigns[:lobbies]).to eq lobbies
    end

    it "renders index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  def create_lobbies
    6.times do |index|
      create(:lobby, name: "New lobby #{index}")
    end
  end

  def create_users
    6.times do
      create(:user, username: Faker::Name.unique.name, email: Faker::Internet.unique.email, points: rand(10..80))
    end
  end
end
