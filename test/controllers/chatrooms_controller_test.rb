require 'test_helper'

class ChatroomsControllerTest < ActionDispatch::IntegrationTest

  test "should save chatroom without attributes" do
    chatroom = Chatroom.new
    assert chatroom.save, "Did not save the chatroom"
  end

  test "should add name to chatroom" do
    chatroom = Chatroom.new
    assert chatroom.roomname.blank?, "Did not add name to chatroom"
  end

  test "should add first message to chatroom" do
    chatroom = Chatroom.new
    assert !chatroom.messages.nil?, "Added first message to chatrooms"
  end

end
