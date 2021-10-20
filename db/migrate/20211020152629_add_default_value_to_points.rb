class AddDefaultValueToPoints < ActiveRecord::Migration[6.1]
  def change
    change_column :lobbies, :avg_points, :integer, default: 0
  end
end
