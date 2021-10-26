require "rails_helper"

RSpec.describe Lobby, type: :model do
  describe "should have many user_in_lobbies" do
    it { should have_many(:user_in_lobbies).dependent(:destroy) }
  end

  describe "should have many users" do
    it { should have_many(:users).through(:user_in_lobbies) }
  end

  describe "should belong to a host, through the class_name User" do
    it { should belong_to(:host).class_name('User') }
  end

  describe "should accept nested attributes for user_in_lobbies" do
    it { should accept_nested_attributes_for(:user_in_lobbies) }
  end

  describe "validates presence of name" do
    it { should validate_presence_of(:name) }
  end

  describe "validates that each lobby name is unique" do
    it { should validate_uniqueness_of(:name) }
  end

  describe "#find_winners should be false when the lobby is not full" do
    it do
      lobby = build(:lobby, is_full: false)
      message = lobby.find_winners
      expect(message).to eq nil
    end
  end

  describe "should grab the lobby 1st and 2nd place players update their point count, and generate a message" do
    it do
      lobby = build(:lobby, is_full: true)
      4.times do 
        lobby.users << build(:user, username: Faker::Name.unique.name, email: Faker::Internet.unique.email)
      end
      message = lobby.find_winners
      expect(message).to include("earned 10 points for winning!")
      expect(message).to include("earned 5 points for second place!")
    end
  end
end