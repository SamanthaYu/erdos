class PrivateChatsController < ApplicationController
  before_action :set_private_chat, only: [:show, :edit, :update, :destroy]

  # POST /private_chats
  # POST /private_chats.json

  def create
    @private_chat = PrivateChat.new(private_chat_params)
    @that_chatroom = Chatroom.find_by(id: @private_chat.chatroom_id)
    if @that_chatroom.private_chatters.size < 2
      @those_users = Array.new(@that_chatroom.users.size+1)
      @user_num = 0
      @that_chatroom.users.each do |poster|
        if poster != @those_users[@user_num] && poster != current_user
          @user_num += 1
          @those_users[@user_num] = poster
          PrivateChat.create(:user_id => poster.id, :chatroom_id => @that_chatroom.id)
        end
      end
    end
    if @private_chat.save
      redirect_to :back
    else
      redirect_to :back
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
