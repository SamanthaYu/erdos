class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :user_id
      t.integer :message_id
      t.string :username
<<<<<<< HEAD
      t.integer :type
=======
      t.string :userType
>>>>>>> e5f087c678f9a8cd1ab561e3d73cfb11ff4a07d6
      t.timestamps
    end
  end
end
