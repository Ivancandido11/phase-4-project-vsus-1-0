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

  context "validations" do
    describe "validates maximum 4 players per lobby" do
      it "it does not let a player join if the lobby is full" do
        create_lobby_with_players(4)
        
        user_in_lobby = create(:user_in_lobby, lobby: @lobby)

        expect(@lobby.users).not_to include(user_in_lobby.user)
        expect(@lobby.errors.full_messages).to include (match("#{@lobby.name} is full."))
      end

      it "lobby gets updated to full when a 4th player joins" do
        create_lobby_with_players(3)

        expect(@lobby.is_full).to eq false

        create(:user_in_lobby, lobby: @lobby)

        expect(@lobby.is_full).to eq true
      end

      it "lets a player join when lobby is not full" do
        create_lobby_with_players(2)

        user_in_lobby = create(:user_in_lobby, lobby: @lobby)

        @lobby.reload

        expect(@lobby.users).to include(user_in_lobby.user)
      end
    end

    describe "validates that a lobby has a host" do
      it "will add a host if lobby does not have one" do
        lobby = build(:lobby, host: nil)

        user_in_lobby = create(:user_in_lobby, lobby: lobby)

        expect(lobby.host).to eq user_in_lobby.user
      end

      it "will not overwrite host if lobby already has one" do
        user = create(:user)
        lobby = create(:lobby, host: user)
        user2 = create(:user, username: "Testing 2", email: "Testing2@gmail.com")

        user_in_lobby = create(:user_in_lobby, user: user2 ,lobby: lobby)

        expect(lobby.host).to eq user
      end
    end

    describe "validates only a user can only be in one lobby at a time" do
      it "allows a user to join a lobby if they are not in one already" do
        user = create(:user)

        user_in_lobby = create(:user_in_lobby, user: user)

        user_in_lobby.lobby.reload

        expect(user_in_lobby.lobby.users).to include(user)
      end

      it "will not allow a user to join if they are in a lobby already" do
        user = create(:user)
        lobby = create(:lobby)
        lobby2 = create(:lobby, name: "Lobby 2")
        user_in_lobby = create(:user_in_lobby, user: user, lobby: lobby)

        expect{create(:user_in_lobby, user: user, lobby: lobby2)}.to raise_error(ActiveRecord::RecordInvalid)
        expect(lobby2.users).not_to include(user)
      end
    end
  end

  def create_lobby_with_players(num)
    @lobby = build(:lobby, is_full: false)
    num.times do 
      @lobby.users << build(:user, username: Faker::Name.unique.name, email: Faker::Internet.unique.email)
    end
  end
end