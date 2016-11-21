require 'test_helper'

class PageTests < ActionDispatch::IntegrationTest
  test "can see the home page" do
    get "/"
    assert_select "title", "Erdos"
  end

  test "can see the signup page" do
    get "/signup"
    assert_select "h1", "sign up"
  end

  test "can see the login page" do
    get "/login"
    assert_select "h1", "login"
  end
end
