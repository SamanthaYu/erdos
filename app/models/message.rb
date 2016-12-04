class Message < ApplicationRecord

  # ensure that all messages are sorted in ascending order
  default_scope { order(created_at: :asc) }
  belongs_to :chatroom
  belongs_to :user
  has_one :notification
  #something about user?

  validates :content, presence: true, length: {minimum: 1}

  def notify
    @notification = Notification.create(:message_id => self.id, :event => "#{self.user.username} posted a new message in #{self.chatroom.roomname}.")
    self.notification = @notification
  end
end
