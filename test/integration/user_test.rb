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






end
