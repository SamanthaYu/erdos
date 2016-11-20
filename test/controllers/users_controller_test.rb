require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "should not save user without attributes" do
    user = User.new
    assert_not user.save, "Saved the user without attributes"
  end

  test "should not save user with short usernames" do
    user = User.new("username" => "hi")
    assert_not user.save, "Saved the user with short usernames"
  end

  test "should not save user with short passwords" do
    user = User.new("username" => "hey", "password" => "hello")
    assert_not user.save, "Saved the user with short password"
  end

end
