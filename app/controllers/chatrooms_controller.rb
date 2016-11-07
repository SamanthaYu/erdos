class ChatroomsController < ApplicationController
  def index
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
      first = Message.create(:content => 'Chatroom \'' << @chatroom.roomname << '\' was create by ' << current_user.username, :chatroom_id => @chatroom.id, :user_id => current_user.id)
      respond_to do |format|
        format.html { redirect_to @chatroom }
        format.js
      end
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
    @message = Message.new
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
      params.require(:chatroom).permit(:roomname)
    end


end
