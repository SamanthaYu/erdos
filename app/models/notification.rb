class Notification < ApplicationRecord
    include Rails.application.routes.url_helpers

    acts_as_readable :on => :created_at
    after_create { notifyUsers }

    belongs_to :message
    has_and_belongs_to_many :users

    def emojime(content)
      EmojiParser.parse(content) do |emoji|
        '<img src="/'+emoji.image_filename+'" alt=":'+emoji.name+':" class="emojis">'
      end
    end

    def notifyUsers
      @receivingUsers = User.where(id: self.message.chatroom.users.map(&:id)).where.not(id: self.message.user.id)
      @receivingUsers.each do |user|
        user.notifications << self
        user.notifications.sort_by(&:created_at)
        msgcontent = emojime(self.message.content).html_safe
        ActionCable.server.broadcast "notification_channel_#{user.id}",
          counter: user.notifications.unread_by(user).count,
          event: self.event,
          sender: self.message.user.username,
          receiver: user.username,
          chatroomname: self.message.chatroom.roomname,
          chatroomlink: chatroom_path(self.message.chatroom.id),
          message: msgcontent,
          timestamp: self.message.created_at.strftime('%v'),
          id: self.id,
          imagemessageurl: self.message.imagemessage.display.url;
      end
    end
end
