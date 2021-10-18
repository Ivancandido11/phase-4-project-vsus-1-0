class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :profile_pic
      t.string :email
      t.integer :points, default: 0
      t.boolean :in_lobby, default: false
      t.boolean :vip, default: false
      t.boolean :banned, default: false
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
