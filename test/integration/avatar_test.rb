require 'test_helper'

  #include TestHelper::PressEnterHelper
class AvatarTests < ActionDispatch::IntegrationTest

  setup do
    @users = users(:one)
  end

  test "add an avatar on signup" do
    visit signup_path
    assert page.has_content?(:link_or_button, 'Avatar')
  end

  test "add an avatar after signup as non-guest" do
    visit signup_path
    fill_in "username_area", :with => 'newuser'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    click_button('Create Account')
    first(:link, 'newuser').click
    assert page.has_selector?(:link_or_button, 'Edit Avatar')
  end

  test "see avatars next to usernames in chatrooms" do
    visit signup_path
    fill_in "username_area", :with => 'newuser'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    click_button('Create Account')
    visit chatrooms_path
    fill_in "chatroom[roomname]",   :with => 'TestName'
    click_button('Create Chatroom')
    assert page.has_css?('#currentUserAvatar')
  end

  test "see avatars on menu" do
    visit signup_path
    fill_in "username_area", :with => 'newuser'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    click_button('Create Account')
    visit chatrooms_path
    assert page.has_css?('#avatar')
  end

  test "see avatars on users" do
    visit signup_path
    fill_in "username_area", :with => 'newuser'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    click_button('Create Account')
    visit users_path
    assert page.has_css?('#userListAvatar')
  end

end
