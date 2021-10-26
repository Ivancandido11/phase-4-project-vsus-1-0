FactoryBot.define do
  factory :lobby do
    name { "New Lobby" }
    transient do 
      host { build(:user) }
    end
  end
end