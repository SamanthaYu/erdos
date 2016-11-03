class CreateChatrooms < ActiveRecord::Migration[5.0]
  def change
    create_table :chatrooms do |t|
      t.belongs_to :user, index: true
      t.string :roomname
      t.timestamps
    end
  end
end
