require 'test_helper'

  #include TestHelper::PressEnterHelper
class ChatroomTests < ActionDispatch::IntegrationTest

  setup do
    @chatroom = chatrooms(:one)
  end


  test "cannot see chatrooms without login" do
    visit chatrooms_path
    assert page.has_current_path?('/')
  end

  test "chatroom created successfully" do
    visit signup_path
    fill_in "username_area", :with => 'newuser'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    click_button('Create Account')
    visit chatrooms_path
    fill_in "chatroom[roomname]",   :with => 'TestName'
    click_button('Create Chatroom')
    assert page.has_content?("Chatroom 'TestName' was created by newuser")
  end

  test "can post inside the chatroom" do
    visit signup_path
    fill_in "username_area", :with => 'newuser'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    click_button('Create Account')
    visit chatrooms_path
    fill_in "chatroom[roomname]",   :with => 'TestName'
    click_button('Create Chatroom')
    fill_in('message_content', :with => 'This is a message\n')
    assert page.has_content?('This is a message')
  end

end
