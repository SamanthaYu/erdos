require 'test_helper'

class ChatroomTests < ActionDispatch::IntegrationTest

  test "cannot see chatrooms without login" do
    get "/chatrooms"
    follow_redirect!
    assert_response :success
    assert request.path == '/'
  end

  test "chatroom created successfully" do
    visit signup_path
    fill_in "username_area", :with => 'newuser'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    click_button "signup_button"
    page.should has_content?('newuser')
    visit login_path
    fill_in "username_area",   :with => 'newuser'
    fill_in "password_area",   :with => 'trysix'
    click_button "login_button"
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert request.path == '/'
  end

  #post "/articles",
  #  params: { article: { title: "can create", body: "article successfully." } }
  #assert_response :redirect
  #follow_redirect!
  #assert_response :success
  #assert_select "p", "Title:\n  can create"
end
