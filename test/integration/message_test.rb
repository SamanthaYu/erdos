require 'test_helper'

class UserTests < ActionDispatch::IntegrationTest


    test "messages can be posted" do
      visit signup_path
      fill_in "username_area", :with => 'newuser'
      fill_in "password_area", :with => 'trysix'
      fill_in "password_confirmation_area", :with => 'trysix'
      click_button('Create Account')
      visit chatrooms_path
      fill_in "chatroom[roomname]",   :with => 'TestName'
      click_button('Create Chatroom')
      savedurl=current_url
      fill_in('message_content', :with => 'This is a message')
      click_on('message_submit')
      visit savedurl
      assert page.has_content?('This is a message')
    end

    test "image messages can be posted" do
      visit signup_path
      fill_in "username_area", :with => 'newuser'
      fill_in "password_area", :with => 'trysix'
      fill_in "password_confirmation_area", :with => 'trysix'
      click_button('Create Account')
      visit chatrooms_path
      fill_in "chatroom[roomname]",   :with => 'TestName'
      click_button('Create Chatroom')
      savedurl=current_url
      click_on('Upload Image')
      page.attach_file('imgmessagefield', Rails.root + 'test/thumb_default.png')
      click_on('imgUpload_submit')
      visit savedurl
      assert page.has_content?('This is a message')
    end


  test "non-image messages can be edited" do
    visit signup_path
    fill_in "username_area", :with => 'newuser'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    click_button('Create Account')
    visit chatrooms_path
    fill_in "chatroom[roomname]",   :with => 'TestName'
    click_button('Create Chatroom')
    savedurl=current_url
    fill_in('message_content', :with => 'This is a message')
    click_on('message_submit')
    visit savedurl
    click_on('edit_link')
    fill_in('editmessage_content', :with => 'This is an edited message')
    click_button('edit')
    visit savedurl
    assert page.has_content?('This is an edited message')
  end

  test "all messages can be deleted" do
      visit signup_path
      fill_in "username_area", :with => 'newuser'
      fill_in "password_area", :with => 'trysix'
      fill_in "password_confirmation_area", :with => 'trysix'
      click_button('Create Account')
      visit chatrooms_path
      fill_in "chatroom[roomname]",   :with => 'TestName'
      click_button('Create Chatroom')
      savedurl=current_url
      fill_in('message_content', :with => 'This is a message')
      click_on('message_submit')
      visit savedurl
      click_on('delete_link')
      click_button('deletemessage_submit')
      visit savedurl
      assert page.has_no_content?('This is a message')
  end





end
