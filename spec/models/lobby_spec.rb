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
end