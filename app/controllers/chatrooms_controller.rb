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
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      if @chatroom.roomname.blank?
        @chatroom.roomname = chatroom_path(@chatroom)
      end
      if !current_user.nil?
        first = Message.create(:content => 'Chatroom \'' << @chatroom.roomname << '\' was created by ' << current_user.username, :chatroom_id => @chatroom.id, :user_id => current_user.id, :poster => current_user.username)
      else
        first = Message.create(:content => 'Chatroom \'' << @chatroom.roomname << '\' was created by Gerbil', :chatroom_id => @chatroom.id, :user_id => nil)
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

  def update
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    if !logged_in?
      redirect_to :root
    elsif !@chatroom.private_chatters.empty? && !@chatroom.private_chatters.where(id: current_user).exists?
      flash[:notice] = "Private Chatroom: Access Denied"
      redirect_to '/chatrooms'
    end
    @message = Message.new
    @private_chat = PrivateChat.new
  end

  def destroy
    @chatroom = Chatroom.find(params[:id])
    if @chatroom.present?
      @chatroom.destroy
    end
    render chatrooms_url
  end

  private

    def chatroom_params
      params.require(:chatroom).permit(:roomname)
    end


end
