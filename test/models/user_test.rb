require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:four)
    @user2 = users(:six)
    @user3 = users(:seven)
    @user4 = users(:eight)
  end

  test "username should be at least 3 characters" do
    assert @user.invalid?, "username is too short"
  end

  test "password should be at least 6 characters" do
    assert @user2.invalid?, "password is too short"
  end

  test "username should be upto 12 characters long" do
    assert @user3.invalid?, "username is too long"
  end

  test "password should be upto 30 characters long" do
    assert @user4.invalid?, "password is too long"
  end

  # test "the truth" do
  #   assert true
  # end
end
