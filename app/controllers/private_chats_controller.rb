class PrivateChatsController < ApplicationController
  before_action :set_private_chat, only: [:show, :edit, :update, :destroy]

  # POST /private_chats
  # POST /private_chats.json

  def create
    if Chatroom.find(private_chat_params[:chatroom_id]).private_chatters.empty? && Chatroom.find(private_chat_params[:chatroom_id]).owner != current_user
      flash[:notice] = "Only the owner can make a chatroom private"
      redirect_back(fallback_location: '/chatrooms')
    elsif Chatroom.find(private_chat_params[:chatroom_id]).private_chatters.empty?
      @private_chat = PrivateChat.new(private_chat_params)
      Chatroom.find(private_chat_params[:chatroom_id]).users.uniq.each do |user|
        if user.userType != 'Guest' && user != current_user
          PrivateChat.create(user_id: user.id, chatroom_id: private_chat_params[:chatroom_id])
        end
      end
      if @private_chat.save
        redirect_back(fallback_location: '/chatrooms')
      else
        redirect_back(fallback_location: '/chatrooms')
      end
    else
      @private_chat = PrivateChat.new(private_chat_params)
      if @private_chat.save
        redirect_back(fallback_location: '/chatrooms')
      else
        redirect_back(fallback_location: '/chatrooms')
      end
    end
  end

  # DELETE /private_chats/1
  # DELETE /private_chats/1.json
  def destroy
    @private_chat.destroy
    respond_to do |format|
      format.html { redirect_to private_chats_url, notice: 'Private chat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_private_chat
      @private_chat = PrivateChat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def private_chat_params
      params.require(:private_chat).permit(:user_id, :chatroom_id)
    end
end
