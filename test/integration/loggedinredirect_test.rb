require 'test_helper'

class LoginRedirectTests < ActionDispatch::IntegrationTest

  test "can't signup while logged in" do
    visit signup_path
    fill_in "username_area", :with => 'newuser'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    click_button('Create Account')
    visit signup_path
    assert page.has_no_content?('Create Account')
  end

  test "can't login again while logged in" do
    visit signup_path
    fill_in "username_area", :with => 'newuser'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    click_button('Create Account')
    visit login_path
    assert page.has_no_content?('Log in')
  end



  #post "/articles",
  #  params: { article: { title: "can create", body: "article successfully." } }
  #assert_response :redirect
  #follow_redirect!
  #assert_response :success
  #assert_select "p", "Title:\n  can create"
end
