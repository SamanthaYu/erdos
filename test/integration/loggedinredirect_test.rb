require 'test_helper'

class LoginRedirectTests < ActionDispatch::IntegrationTest

  test "can't signup while logged in" do
    get "/chatrooms"
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
