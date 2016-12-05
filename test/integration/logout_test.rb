require 'test_helper'

class LogoutTests < ActionDispatch::IntegrationTest

  test "can logout as a regular or admin user" do
    visit signup_path
    fill_in "username_area", :with => 'newuser'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    click_button('Create Account')
    visit chatrooms_path
    page.click_link('logoutLink')
    assert page.has_current_path?('/')
  end

  test "can logout as a guest user" do
    visit signup_path
    click_button('Guest Login')
    fill_in "guest_username_area", :with => 'guestuser'
    click_button('Login as Guest')
    visit chatrooms_path
    assert page.has_content?('List of Current Chatrooms')
    page.click_link('logoutLink')
    assert page.has_current_path?('/')
    assert !User.where(username: 'guestuser').exists?
  end

end
