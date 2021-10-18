class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :profile_pic
      t.string :email
      t.integer :points
      t.boolean :in_lobby
      t.boolean :vip
      t.boolean :banned
      t.boolean :admin

      t.timestamps
    end
  end
end
