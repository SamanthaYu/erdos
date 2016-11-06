class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
  @message = Message.order(:id)
  #something about user?
end
