class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :user_id
      t.integer :message_id
      t.string :username
      t.integer :type
      t.string :userType
      t.timestamps
    end
  end
end
