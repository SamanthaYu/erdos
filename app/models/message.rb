class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
  #something about user?
end
