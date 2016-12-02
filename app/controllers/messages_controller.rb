class MessagesController < ApplicationController

  def create
    #caller.each{|i| puts i}
    message = Message.new(message_params)
    if message.content.blank?
      message.delete
    elsif message.save
      roomname=message.chatroom.roomname
      if message.chatroom.roomname.blank?
        roomname = chatroom_path(message.chatroom)
      end
      ActionCable.server.broadcast 'messages',
        type: "new",
        chatroomname: roomname,
        avatarurl: message.user.avatar.thumb.url,
        message: message.content,
        poster: message.poster,
        currentuser: current_user.username,
        editlink: edit_message_path(message),
        id: message.id,
        timestamp: view_context.local_time_ago(message.created_at);
      head :ok
    end
  end

def edit
    @message = Message.find(params[:id])
    respond_to do |format|
        format.html {}
        format.js {}
    end
end

def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
        roomname=@message.chatroom.roomname
        if @message.chatroom.roomname.blank?
          roomname = chatroom_path(@message.chatroom)
        end
        ActionCable.server.broadcast 'messages',
          type: "edit",
          chatroomname: roomname,
          avatarurl: @message.user.avatar.thumb.url,
          message: @message.content,
          poster: @message.poster,
          currentuser: current_user.username,
          editlink: edit_message_path(@message),
          id: @message.id,
          createtimestamp: view_context.local_time_ago(@message.created_at),
          edittimestamp: view_context.local_time_ago(@message.updated_at);
        head :ok
    else
        if @message.content.blank?
          flash[:notice] = "Message cannot be empty"
        end
    end
end

  private
    def message_params
      params.require(:message).permit(:content, :chatroom_id, :user_id, :poster)
    end

end
