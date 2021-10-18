class CreateUserInLobbies < ActiveRecord::Migration[6.1]
  def change
    create_table :user_in_lobbies do |t|
      t.integer :user_id
      t.integer :lobby_id

      t.timestamps
    end
  end
end
