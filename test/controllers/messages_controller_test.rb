require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  
  test "should not save messages without attributes" do
    message = Message.new
    assert_not message.save, "Saved the chatroom without attributes"
  end

end
