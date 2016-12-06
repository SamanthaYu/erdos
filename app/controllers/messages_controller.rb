class MessagesController < ApplicationController



  def new_image
    @message=Message.new
    @chatroom=Chatroom.find(params[:id])

    respond_to do |format|
        format.js {}
        format.html{render partial: 'messages/imgupload_form', locals: {message: @message, chatroom: @chatroom}}
    end
  end

  def create_image
    @message = Message.new(params.require(:message).permit(:content, :chatroom_id, :user_id, :poster, :imagemessage))
    @chatroom=Chatroom.find_by(id: @message.chatroom_id)
    if @message.save
      roomname=@message.chatroom.roomname
      if @message.chatroom.roomname.blank?
        roomname = chatroom_path(@message.chatroom)
      end
      ActionCable.server.broadcast 'messages',
        type: "new",
        isimage: 1,
        content: "IMG",
        imagemessageurl: @message.imagemessage.display.url,
        chatroomname: roomname,
        avatarurl: @message.user.avatar.thumb.url,
        poster: @message.poster,
        currentuser: current_user.username,
        editlink: edit_message_path(@message),
        deletelink: delete_message_path(@message),
        id: @message.id,
        timestamp: view_context.local_time_ago(@message.created_at);
      @message.notify
      redirect_back(fallback_location: '/chatrooms')
    else
      if @message.imagemessage.display.url=="THISISNOTANIMAGE"
        @message.delete
      end
    end

  end


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
        content: message.content, #the plaintext
        isimage: 0,
        chatroomname: roomname,
        avatarurl: message.user.avatar.thumb.url,
        message: emojime(message.content).html_safe,
        poster: message.poster,
        currentuser: current_user.username,
        editlink: edit_message_path(message),
        deletelink: delete_message_path(message),
        wolframlink: wolframAlpha_message_path(message),
        id: message.id,
        timestamp: view_context.local_time_ago(message.created_at);
      head :ok
      message.notify
    end
  end

def edit
    @message = Message.find(params[:id])
    respond_to do |format|
        format.js {}
        format.html{ render partial: 'messages/editmessage_form', locals: {message: @message, chatroom: @chatroom}}
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
            isimage: 0,
            content: @message.content, #the plaintext
            message: emojime(@message.content).html_safe,
            id: @message.id,
            createtimestamp: view_context.local_time_ago(@message.created_at),
            edittimestamp: view_context.local_time_ago(@message.updated_at);
        head :ok
    else
        if @message.content.blank?
          render 'delete'
        end
    end
end

def delete
    @message = Message.find(params[:id])
    respond_to do |format|
        format.js {}
        format.html {render partial: 'messages/delete_form', locals: {message: @message, chatroom: @chatroom}}
    end
end

def destroy
    @message = Message.find(params[:id])
    roomname=@message.chatroom.roomname
    if @message.chatroom.roomname.blank?
      roomname = chatroom_path(@message.chatroom)
    end
    ActionCable.server.broadcast 'messages',
      type: "delete",
      chatroomname: roomname,
      id: @message.id;
    head :ok
    @message.destroy
end

def wolframAlpha
  @message = Message.find(params[:id])
  respond_to do |format|
    format.js{}
  end
end


  private
    def message_params
      params.require(:message).permit(:content, :chatroom_id, :user_id, :poster, :imagemessage)
    end

end
