FactoryBot.define do
  factory :lobby do
    name { "New Lobby" }
    host { build(:user) }
  end
end