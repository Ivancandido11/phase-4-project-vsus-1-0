class CreatePlayerInLobbies < ActiveRecord::Migration[6.1]
  def change
    create_table :player_in_lobbies do |t|
      t.integer :player_id
      t.integer :lobby_id

      t.timestamps
    end
  end
end
