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
    sender = User.create(:id => 1, :username => "sender", :password => "123456")
    receiver1 = User.create(:id => 2, :username => "receiver1", :password => "123456")
    chatroom = Chatroom.create(:roomname => "newchatroom", :id => 1, :user_id => 1)
    message = Message.create(:content => "I created this chatroom", :chatroom_id => 1, :user_id => 1, :poster => sender.username)
    message2 = Message.create(:content => "Hi I'm joining the chatroom", :chatroom_id => 1, :user_id => 2, :poster => receiver1.username)

    message.notify
    assert_equal(1, message.notifications.count)

    receiver2 = User.create(:id => 3, :username => "receiver2", :password => "123456")
    message3 = Message.create(:content => "Can i join too?", :chatroom_id => 1, :user_id => 3, :poster => receiver2.username)
    message3.notify
    assert_equal(2, message3.notifications.count)

    receiver3 = User.create(:id => 4, :username => "receiver3", :password => "123456")
    message4 = Message.create(:content => "me too!", :chatroom_id => 1, :user_id => 4, :poster => receiver3.username)
    message4.notify
    assert_equal(3, message4.notifications.count)
  end

end
