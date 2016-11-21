class MessagesController < ApplicationController
  include LocalTime
  
  def create
    #caller.each{|i| puts i}
    message = Message.new(message_params)
    if message.content.blank?
      message.delete
    elsif message.save
      #previous = Message.where(:chatroom_id => message.chatroom_id, :created_at < message.created_at).last
      ActionCable.server.broadcast 'messages',
        chatroomname: message.chatroom.roomname,
        avatarurl: message.user.avatar.thumb.url,
        message: message.content,
        poster: message.poster,
        currentuser: current_user.username,
        timestamp: local_time_ago(message.created_at)
      head :ok
    end
  end

#  def edit
#  end

#  def update
#    if message.update(message_params)
#      ActionCable.server.broadcast 'messages',
#        message: message.content
#      head :ok
#    end
#  end

  private
    def message_params
      params.require(:message).permit(:content, :chatroom_id, :user_id, :poster)
    end

end
