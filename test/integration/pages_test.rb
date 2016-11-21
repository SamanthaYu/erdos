require 'test_helper'

class PageTests < ActionDispatch::IntegrationTest
  test "can see the home page" do
    visit "/"
    assert page.has_current_path?('/')
  end

  test "can see the signup page" do
    visit "/signup"
    assert page.has_current_path?('/signup')
  end

  test "can see the login page" do
    visit "/login"
    assert page.has_current_path?('/login')
  end
end
