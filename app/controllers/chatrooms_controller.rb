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
      respond_to do |format|
        format.html { redirect_to @chatroom }
        format.js
      end
    else
      respond_to do |format|
        #flash[:notice] = {error: ["a chatroom with this topic already exists"]}
        format.html { render :new }
        format.js { render template: 'chatrooms/chatroom_error.js.erb'}
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
