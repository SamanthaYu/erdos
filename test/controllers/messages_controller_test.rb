require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest

  test "should save messages without attributes" do
    message = Message.new
    assert message.save, "Did not save the message"
  end

end
