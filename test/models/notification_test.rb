require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "notification should notify a user upon creation" do
    sender = User.create(:id => 1, :username => "sender", :password => "123456")
    receiver1 = User.create(:id => 2, :username => "receiver1", :password => "123456")
    chatroom = Chatroom.create(:roomname => "newchatroom", :id => 1, :user_id => sender.id)
    message = Message.create(:content => "I'm the owner of this chatroom", :chatroom_id => chatroom.id, :user_id => sender.id, :poster => sender.username)
    message2 = Message.create(:content => "I'm joining the chatroom", :chatroom_id => chatroom.id, :user_id => receiver1.id, :poster => receiver1.username)

    notification = Notification.create(:message_id => message.id,
                                        :event => "#{message.user.username} posted a new message in #{message.chatroom.roomname}.",
                                        :user_id => receiver1.id)

    assert_equal(1, receiver1.notifications.count)
    assert_equal("sender posted a new message in newchatroom.", receiver1.notifications.first.event)
    assert_equal("I'm the owner of this chatroom", receiver1.notifications.first.message.content)

    message3 = Message.create(:content => "Welcome!", :chatroom_id => chatroom.id, :user_id => sender.id, :poster => sender.username)
    notification2 = Notification.create(:message_id => message3.id,
                                        :event => "#{message3.user.username} posted a new message in #{message3.chatroom.roomname}.",
                                        :user_id => receiver1.id)

    assert_equal(2, receiver1.notifications.count)
    assert_equal("sender posted a new message in newchatroom.", receiver1.notifications.second.event)
    assert_equal("Welcome!", receiver1.notifications.second.message.content)
  end

end
