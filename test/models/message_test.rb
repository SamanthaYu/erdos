require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save empty message" do
    message = Message.new
    assert !message.save, "did not save the message"
  end

  test "message should send one notification to each receiving user" do
    sender = users(:sender)
    receiver1 = users(:receiver1)
    chatroom = chatrooms(:newchatroom)
    message = Message.create(:content => "I created this chatroom", :chatroom_id => chatroom.id, :user_id => sender.id, :poster => sender.username)
    message2 = Message.create(:content => "Hi I'm joining the chatroom", :chatroom_id => chatroom.id, :user_id => receiver1.id, :poster => receiver1.username)

    message.notify
    assert_equal(1, message.notifications.count)

    receiver2 = users(:receiver2)
    message3 = Message.create(:content => "Can i join too?", :chatroom_id => chatroom.id, :user_id => receiver2.id, :poster => receiver2.username)
    message3.notify
    assert_equal(2, message3.notifications.count)

    receiver3 = users(:receiver3)
    message4 = Message.create(:content => "me too!", :chatroom_id => chatroom.id, :user_id => receiver3.id, :poster => receiver3.username)
    message4.notify
    assert_equal(3, message4.notifications.count)
  end

end
