class Notification < ApplicationRecord
    after_create { notifyUsers }

    belongs_to :message
    has_and_belongs_to_many :users

    def notifyUsers
      @receivingUsers = User.where(id: self.message.chatroom.users.map(&:id)).where.not(id: self.message.user.id)
      @receivingUsers.each do |user|
        user.notifications << self
        user.notifications.sort_by(&:created_at)
        ActionCable.server.broadcast "notification_channel_#{user.id}",
          counter: user.notifications.count,
          event: self.event,
          sender: self.message.user,
          chatroomname: self.message.chatroom.roomname,
          chatroomlink: chatroom_path(self.message.chatroom.id),
          timestamp: self.message.created_at.strftime('%v');
      end
    end
end
