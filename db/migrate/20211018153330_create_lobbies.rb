class CreateLobbies < ActiveRecord::Migration[6.1]
  def change
    create_table :lobbies do |t|
      t.string :name
      t.integer :avg_points
      t.boolean :private, default: false
      t.boolean :is_full, default: false

      t.timestamps
    end
  end
end
