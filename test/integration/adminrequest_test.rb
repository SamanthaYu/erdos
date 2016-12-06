require 'test_helper'

class AdminRequestTests < ActionDispatch::IntegrationTest

  test "first user is made admin" do
    visit signup_path
    fill_in "username_area", :with => 'newuser'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    click_button('Create Account')
    click_link("newuser")
    assert page.has_content?("Admin")
  end

  test "regular user can request admin" do
    visit signup_path
    fill_in "username_area", :with => 'newuser'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    click_button('Create Account')
    user=User.find_by(username: 'newuser')
    user.update_attribute :userType, 'Regular'
    click_link("newuser")
    assert page.has_button?('Request Admin')
  end

  test "admin user can accept admin request" do
    visit signup_path
    fill_in "username_area", :with => 'newadmin'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    click_button('Create Account')
    user=User.find_by(username: 'newadmin')
    user.update_attribute :userType, 'Admin'
    click_link("newadmin")
    assert page.has_content?('gerbil')
  end

end
