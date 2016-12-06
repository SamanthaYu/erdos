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
    assert page.has_current_path?('/chatrooms')
  end

  test "add a user to a private chatroom" do
    visit signup_path
    fill_in "username_area", :with => 'newuser'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    click_button('Create Account')
    visit chatrooms_path
    fill_in "chatroom[roomname]",   :with => 'TestName'
    click_button('Create Chatroom')
    click_button('Make Private')
    select 'gerbil', :from => 'privatechatselector'
    click_on('Add User')
    assert page.has_content?('gerbil')
  end

  test "check the members of a private chatroom" do
    visit signup_path
    fill_in "username_area", :with => 'newuser'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    click_button('Create Account')
    visit chatrooms_path
    fill_in "chatroom[roomname]",   :with => 'TestName'
    click_button('Create Chatroom')
    click_button('Make Private')
    select 'gerbil', :from => 'privatechatselector'
    click_on('Add User')
    visit current_url
    assert (page.has_content?('gerbil') && page.has_content?('newuser'))
    assert page.has_css?('li#private_chatters', :count => 2)
  end

  test "see whether chatrooms are public/private" do
    visit signup_path
    fill_in "username_area", :with => 'newuser'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    click_button('Create Account')
    visit chatrooms_path
    fill_in "chatroom[roomname]",   :with => 'PrivateTestName'
    click_button('Create Chatroom')
    click_button('Make Private')
    visit chatrooms_path
    fill_in "chatroom[roomname]",   :with => 'PublicTestName'
    visit chatrooms_path
    assert (page.has_css?('#privateyes', :count => 1) && page.has_css?('#privateno', :count => 1))
  end





end
