class ChatroomsController < ApplicationController
  def index
    @chatroom=Chatroom.new
    @chatrooms=Chatroom.all
  end

  def new
    @chatroom=Chatroom.new
  end

  def destroy
    @chatroom = Chatroom.find(params[:id])
    if @chatroom.present?
      @chatroom.destroy
    end
    redirect_to chatrooms_url
  end

  def edit
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
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

  private

    def chatroom_params
      params.require(:chatroom).permit(:roomname)
    end


end
