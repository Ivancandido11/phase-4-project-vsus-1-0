class CreateLobbies < ActiveRecord::Migration[6.1]
  def change
    create_table :lobbies do |t|
      t.string :name
      t.integer :avg_points
      t.boolean :private
      t.boolean :is_full
      t.string :no-test-framework

      t.timestamps
    end
  end
end
