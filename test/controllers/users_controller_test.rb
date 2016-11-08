require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "should not save user without attributes" do
    user = User.new
    assert_not user.save, "Saved the user without attributes"
  end

end
