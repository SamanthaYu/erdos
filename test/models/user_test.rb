require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

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

  test "usernames are case sensitive" do
    assert_equal("MaryPoppins", @user4.username)
    assert_not_equal("marypoppins", @user4.username)
  end

  test "delete friendships should delete all friendships" do
    @friend1 = users(:receiver1)
    @friend2 = users(:receiver2)
    @friend3 = users(:receiver3)

    @friendship1 = friendships(:three)
    @friendship2 = friendships(:four)

    # friend1 friends with friend2 and friend3
    assert_equal(2, @friend1.friendships.count)

    # friend3 is not a friend of friend1 (friend 3 is inverse friend)
    assert_equal(1, @friend3.inverse_friendships.count)

    @friend1.delete_friendships
    assert_equal(0, @friend1.friendships.count)

    @friend3.delete_friendships
    assert_equal(0, @friend3.inverse_friendships.count)
  end
end
