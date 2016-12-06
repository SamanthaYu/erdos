require 'test_helper'

class LoginTests < ActionDispatch::IntegrationTest

  test "can login as a regular or admin user" do
    visit signup_path
    fill_in "username_area", :with => 'newuser'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    click_button('Create Account')
    visit chatrooms_path
    page.click_link('logoutLink')
    visit login_path
    fill_in "username_area", :with => 'newuser'
    fill_in "password_area", :with => 'trysix'
    page.click_button('login_button')
    visit chatrooms_path
    assert page.has_content?('List of Current Chatrooms')
  end

end
