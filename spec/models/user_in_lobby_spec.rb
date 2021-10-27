require "rails_helper"

RSpec.describe UserInLobby, type: :model do
  context "associations" do
    describe "Belongs to a user" do
      subject { build(:user_in_lobby) }
      
      it { should belong_to(:user) }
    end

    describe "Belongs to a lobby" do
      subject { build(:user_in_lobby) }
      
      it { should belong_to(:lobby) }
    end
  end

end