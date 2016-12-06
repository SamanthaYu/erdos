require 'test_helper'

class HideMessageAreaTests < ActionDispatch::IntegrationTest

  test "can hide messaging area" do
    visit signup_path
    click_button('Guest Login')
    fill_in "guest_username_area", :with => 'guestuser'
    click_button('Login as Guest')
    visit chatrooms_path
    fill_in "chatroom[roomname]",   :with => 'TestName'
    click_button('Create Chatroom')
    find('#messageBoxCloser').click
    assert !(find('#message_content')[:bottom] == 200)
  end

  test "hidden messaging area shows up when toggled" do
    visit signup_path
    click_button('Guest Login')
    fill_in "guest_username_area", :with => 'guestuser'
    click_button('Login as Guest')
    visit chatrooms_path
    fill_in "chatroom[roomname]",   :with => 'TestName'
    click_button('Create Chatroom')
    find('#messageBoxCloser').click
    find('#messageBoxOpener').click
    assert page.has_content?('Upload Image')
  end



  #post "/articles",
  #  params: { article: { title: "can create", body: "article successfully." } }
  #assert_response :redirect
  #follow_redirect!
  #assert_response :success
  #assert_select "p", "Title:\n  can create"
end
