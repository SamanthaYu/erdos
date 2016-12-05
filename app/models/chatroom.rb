class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :users, through: :messages
  has_many :private_chats
  has_many :private_chatters, :through => :private_chats, :source => :user
  belongs_to :owner, :class_name => "User", :foreign_key => "user_id"
end
