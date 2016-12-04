class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.integer :message_id
      t.integer :user_id
      t.string :event
      t.timestamps
    end
  end
end
