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
    first(:link, '+ Add Friend').click
    visit users_path
    assert page.has_content?('Already Added')
    click_link("admin")
    assert page.has_selector?(:link_or_button, '× Remove Friend')
  end

  test "can see friend on users page" do
    visit signup_path
    fill_in "username_area", :with => 'newuser'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    click_button('Create Account')
    visit users_path
    first(:link, '+ Add Friend').click
    visit users_path
    assert page.has_content?('Already Added')
  end

  test "can see friend on profile page" do
    visit signup_path
    fill_in "username_area", :with => 'newuser'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    click_button('Create Account')
    visit users_path
    first(:link, '+ Add Friend').click
    first(:link, 'newuser').click
    assert page.has_content?('admin')
  end

  test "can see inverse_friend on profile page" do
    visit signup_path
    fill_in "username_area", :with => 'abc'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    click_button('Create Account')
    page.click_link('logoutLink')
    visit signup_path
    fill_in "username_area", :with => 'newuser'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    click_button('Create Account')
    visit users_path
    first(:link, '+ Add Friend').click
    page.click_link('logoutLink')
    visit login_path
    fill_in "username_area", :with => 'abc'
    fill_in "password_area", :with => 'trysix'
    page.click_button('login_button')
    first(:link, 'abc').click
    assert page.has_content?('newuser')
  end

end
