require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:four)
  end

  test "too short username" do
    assert @user.invalid?, "invalid too short"
  end



  # test "the truth" do
  #   assert true
  # end
end
