require "rails_helper"

RSpec.describe User, type: :model do
  context "associations" do
    describe "has one user_in_lobby" do
      it { should have_one(:user_in_lobby) }
    end

    describe "has one lobby through user_in_lobby" do
      it { should have_one(:lobby).through(:user_in_lobby) }
    end

    describe "has many lobbies with the foreign key host_id" do
      it { should have_many(:lobbies).with_foreign_key('host_id') }
    end

    describe "has one attached avatar " do
      it { should have_one_attached(:avatar) }
    end

    describe "has a secured password" do
      it { should have_secure_password }
    end
  end
end