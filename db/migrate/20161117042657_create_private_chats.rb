class CreatePrivateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :private_chats do |t|
      t.integer :user_id
      t.integer :chatroom_id

      t.timestamps
    end
  end
end
