require 'test_helper'

class ChatroomTests < ActionDispatch::IntegrationTest
  setup do
    @chatroom = chatrooms(:one)
  end


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
    click_button('Create Account')
    assert page.has_content?('newuser')
    visit chatrooms_path
    assert page.has_content?('Create a New Chatroom')
    fill_in "chatroom[roomname]",   :with => 'TestName'
    click_button('Create Chatroom')
    assert page.has_content?("Chatroom 'TestName' was created by newuser")

#    assert_redirected_to "/users"
#    follow_redirect!
#
    #visit login_path
    #fill_in "username_area",   :with => 'newuser'
    #fill_in "password_area",   :with => 'trysix'
    #click_button "login_button"
  #  assert_response :success
  #  assert request.path == '/'
  end

  #post "/articles",
  #  params: { article: { title: "can create", body: "article successfully." } }
  #assert_response :redirect
  #follow_redirect!
  #assert_response :success
  #assert_select "p", "Title:\n  can create"
end
