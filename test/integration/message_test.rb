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
      page.attach_file('message[imagemessage]', Rails.root + 'test/thumb_default.png')
      click_on('imgUpload_submit')
      visit savedurl
      assert page.has_css?('img', :count => 4) #original was 2, (add 1 extra for avatar)
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

  test "image messages cannot be edited" do
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
    page.attach_file('message[imagemessage]', Rails.root + 'test/thumb_default.png')
    click_on('imgUpload_submit')
    visit savedurl
    assert page.has_no_content?('edit') #original was 2
  end


  test "regular messages can be deleted" do
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

  test "image messages can be deleted" do
    visit signup_path
    fill_in "username_area", :with => 'newuser'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    click_button('Create Account')
    visit chatrooms_path
    fill_in "chatroom[roomname]",   :with => 'TestName'
    click_button('Create Chatroom')
    assert page.has_css?('.message', :count => 1)
    savedurl=current_url
    click_on('Upload Image')
    page.attach_file('message[imagemessage]', Rails.root + 'test/thumb_default.png')
    click_on('imgUpload_submit')
    visit savedurl
    click_on('delete_link')
    click_button('deletemessage_submit')
    visit savedurl
    assert page.has_css?('.message', :count => 1) #original was 2
  end

  test "emoji messages can be posted" do
    visit signup_path
    fill_in "username_area", :with => 'newuser'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    click_button('Create Account')
    visit chatrooms_path
    fill_in "chatroom[roomname]",   :with => 'TestName'
    click_button('Create Chatroom')
    savedurl=current_url
    assert page.has_css?('img', :count => 2)
    fill_in('message_content', :with => ':fire: This is a message')
    click_on('message_submit')
    visit savedurl
    assert page.has_css?('img', :count => 4)
    assert page.has_content?('This is a message')
  end



end
