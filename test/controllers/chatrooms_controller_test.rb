require 'test_helper'

class ChatroomsControllerTest < ActionDispatch::IntegrationTest

  test "should not save chatroom without attributes" do
    chatroom = Chatroom.new
    assert_not chatroom.save, "Saved the chatroom without attributes"
  end

end
