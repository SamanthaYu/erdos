require 'test_helper'

class MenuTests < ActionDispatch::IntegrationTest

  test "retract the menu as any user" do
    visit signup_path
    fill_in "username_area", :with => 'newuser'
    fill_in "password_area", :with => 'trysix'
    fill_in "password_confirmation_area", :with => 'trysix'
    click_button('Create Account')
    visit chatrooms_path
    find("#sideBarCloser").click
    assert page.has_css?("#sidebar", visible: false)
  end

end
