class CreateChatrooms < ActiveRecord::Migration[5.0]
  def change
    create_table :chatrooms do |t|
      t.integer :message_id
      t.integer :user_id
      t.string :roomname
      t.timestamps
    end
  end
end
