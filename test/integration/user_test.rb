require 'test_helper'

class UserTests < ActionDispatch::IntegrationTest

  test "can signup as a regular user" do
    visit signup_path
    fill_in "username_area", :with => 'newuser'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    click_button('Create Account')
    assert page.has_content?('newuser')
  end

  test "can signup as an admin user" do
    visit signup_path
    fill_in "username_area", :with => 'newuser'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    select "Admin", :from => 'user[userType]'
    click_button('Create Account')
    assert page.has_content?('Admin')
  end

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
    fill_in "username_area", :with => 'newuser'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    click_button('Create Account')
    visit chatrooms_path
    assert page.has_content?('Destroy Chatroom')
  end

  test "admins can decide to delete users" do
    visit signup_path
    fill_in "username_area", :with => 'newuser'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    click_button('Create Account')
    visit users_path
    assert page.has_content?('Destroy')
  end

end
