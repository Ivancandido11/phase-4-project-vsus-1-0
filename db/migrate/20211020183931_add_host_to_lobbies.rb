class AddHostToLobbies < ActiveRecord::Migration[6.1]
  def change
    add_column :lobbies, :host_id, :integer
  end
end
