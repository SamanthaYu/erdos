class MessagesController < ApplicationController

  def create
    #caller.each{|i| puts i}
    message= Message.new(message_params)
    if message.save
      ActionCable.server.broadcast 'messages',
        message: message.content
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
