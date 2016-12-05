class ChatroomsController < ApplicationController

  def index
    if !logged_in?
      redirect_to :root
    end
    @chatroom=Chatroom.new
    @chatrooms=Chatroom.all
  end

  def new
    @chatroom=Chatroom.new
  end

  def edit
  end

  def create
    if Chatroom.where(roomname: chatroom_params[:roomname]).exists? && !chatroom_params[:roomname].blank?
      flash[:notice] = "Chatroom " + chatroom_params[:roomname] + " Already Exists"
      redirect_to '/chatrooms'
    else
      @chatroom = Chatroom.new(chatroom_params)
      @chatroom.owner = User.find(chatroom_params[:user_id])
      if @chatroom.save
        if !@chatroom.roomname.blank? && !current_user.nil?
          first = Message.create(:content => 'Chatroom \'' << @chatroom.roomname << '\' was created by ' << current_user.username, :chatroom_id => @chatroom.id, :user_id => current_user.id, :poster => current_user.username)
        elsif !current_user.nil?
          first = Message.create(:content => 'Chatroom \'' << chatroom_path(@chatroom) << '\' was created by ' << current_user.username, :chatroom_id => @chatroom.id, :user_id => current_user.id, :poster => current_user.username)
        else
          first = Message.create(:content => 'The chatroom was created by Gerbil', :chatroom_id => @chatroom.id, :user_id => nil)
        end
        respond_to do |format|
          format.html { }#redirect_to @chatroom }
          format.js
        end
        redirect_to @chatroom
      else
        respond_to do |format|
          format.html { render :new }
        end
      end
    end
  end

  def update
    @chatroom = Chatroom.find(params[:id])
    respond_to do |format|
      if @chatroom.update(params.require(:chatroom).permit(:user_id))
        @chatroom.owner = User.find(chatroom_params[:user_id])
        format.html { redirect_to @chatroom, notice: 'Owner was successfully updated.' }
        format.json { render :show, status: :ok, location: @chatroom }
      else
        format.html { redirect_to @chatroom, notice: 'Owner was not successfully updated.' }
        format.json { render :show, status: :ok, location: @chatroom }
      end
    end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    if !logged_in?
      redirect_to :root
    elsif !@chatroom.private_chatters.empty? && !@chatroom.private_chatters.where(id: current_user).exists?
      flash[:notice] = "Private Chatroom: Access Denied"
      redirect_to '/chatrooms'
    end
    @chatroom.messages.each do |message|
      if message.unread?(current_user)
        message.mark_as_read! :for => current_user
        @notification = Notification.find_by(message_id: message.id)
        if @notification
          @notification.mark_as_read! :for => current_user
        end
      end
    end
    @message = Message.new
    @private_chat = PrivateChat.new
  end

  def destroy
    @chatroom = Chatroom.find(params[:id])
    if @chatroom.present?
      @chatroom.destroy
    end
    redirect_to chatrooms_url
  end

  private

    def chatroom_params
      params.require(:chatroom).permit(:roomname, :user_id)
    end


end
