require 'test_helper'

class UserTests < ActionDispatch::IntegrationTest


    test "mesasges can be posted" do
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
    click_on('edit')
  end

=begin
  test "can signup as an admin user" do
    visit signup_path
    fill_in "username_area", :with => 'newuser'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    select "Admin", :from => 'user[userType]'
    click_button('Create Account')
    assert page.has_content?('Admin')
  end
=end

  test "can enter site as a guest user" do
    visit signup_path
    click_button('Guest Login')
    fill_in "guest_username_area", :with => 'guestuser'
    click_button('Login as Guest')
    visit chatrooms_path
    assert page.has_content?('List of Current Chatrooms')
  end

  test "non-guest users can log into their accounts again" do
    visit signup_path
    fill_in "username_area", :with => 'tologout'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    click_button('Create Account')
    click_on 'Log out'
    visit login_path
    fill_in "username_area", :with => 'tologout'
    fill_in "password_area", :with => 'trysix'
    click_button('Log in')
    assert page.has_content?('tologout')
  end


  test "admins can decide to delete chatrooms" do
    visit signup_path
    fill_in "username_area", :with => 'newadmin'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    click_button('Create Account')
    user=User.find_by(username: 'newadmin')
    user.update_attribute :userType, 'Admin'
    visit chatrooms_path
    assert page.has_content?('Destroy Chatroom')
  end

  test "admins can decide to delete users" do
    visit signup_path
    fill_in "username_area", :with => 'newadmin'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    click_button('Create Account')
    user=User.find_by(username: 'newadmin')
    user.update_attribute :userType, 'Admin'
    visit users_path
    assert page.has_content?('Destroy')
  end

end
