require 'test_helper'

  #include TestHelper::PressEnterHelper
class FriendshipTests < ActionDispatch::IntegrationTest

  setup do
    @users = users(:one)
  end


  test "can find others users" do
    visit signup_path
    fill_in "username_area", :with => 'newuser'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    click_button('Create Account')
    visit users_path
    assert page.has_content?('gerbil')
  end

  test "can add friend" do
    visit signup_path
    fill_in "username_area", :with => 'newuser'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    click_button('Create Account')
    visit users_path
    assert page.has_content?('+ Add Friend')
  end

  test "can remove friend" do
    visit signup_path
    fill_in "username_area", :with => 'newuser'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    click_button('Create Account')
    visit users_path
    click_link("admin")
    assert page.has_content?("+ Add Friend")
    click_button("+ Add Friend")

    assert page.has_content?('× Remove Friend')
    click_button("× Remove Friend")
    #click_button("OK")
    assert page.has_content?('Are you sure you want to remove this friend?')
  end

end
