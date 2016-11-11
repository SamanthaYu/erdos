require 'test_helper'

class ChatroomTests < ActionDispatch::IntegrationTest

  test "cannot see chatrooms without login" do
    get "/chatrooms"
    follow_redirect!
    assert_response :success
    assert request.path == '/'
  end

  test "chatroom created successfully" do
    get "/login"
    assert_response :success
    fill_in 'username',   :with => 'admin'
    fill_in 'password',   :with => 'trysix'
    click_button
    post "/sessions",
    params: { session: { session_id: user.id } }
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
