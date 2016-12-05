require 'test_helper'

  #include TestHelper::PressEnterHelper
class PrivateChatTests < ActionDispatch::IntegrationTest

  test "can make a chat private" do
    visit signup_path
    fill_in "username_area", :with => 'newuser'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    click_button('Create Account')
    visit chatrooms_path
    fill_in "chatroom[roomname]",   :with => 'TestName'
    click_button('Create Chatroom')
    click_button('Make Private')
    assert page.has_content?('Members')
  end

  test "cannot access a private chat without permission" do
    visit signup_path
    fill_in "username_area", :with => 'newuser'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    click_button('Create Account')
    visit chatrooms_path
    fill_in "chatroom[roomname]",   :with => 'TestName'
    click_button('Create Chatroom')
    click_button('Make Private')
    page.click_link('logoutLink')
    visit signup_path
    fill_in "username_area", :with => 'neweruser'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    click_button('Create Account')
    visit chatrooms_path
    click_link('TestName')
    assert page.has_content?('Access Denied')
  end

end
