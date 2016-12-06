require 'test_helper'

#include TestHelper::PressEnterHelper
class AvatarTests < ActionDispatch::IntegrationTest
    test "Math gets rendered while typing" do
        visit signup_path
        click_button('Guest Login')
        fill_in "guest_username_area", :with => 'guestuser'
        click_button('Login as Guest')
        visit chatrooms_path
        fill_in "chatroom[roomname]",   :with => 'TestName'
        click_button('Create Chatroom')

        fill_in "message_content", :with => '$\int_2^7$'
        assert "#mathTyping".has_css?(".katex")
    end

    test "Clicking a math button will enter the symbol into the message area" do
        visit signup_path
        click_button('Guest Login')
        fill_in "guest_username_area", :with => 'guestuser'
        click_button('Login as Guest')
        visit chatrooms_path
        fill_in "chatroom[roomname]",   :with => 'TestName'
        click_button('Create Chatroom')

        first('.mathButton#chatMathMenuButton').click
        assert "#message_content".has_content("$")
        assert "#mathTyping".has_css?(".katex")
    end

    test "Access an external resource for help typing mathematical expressions in plaintext" do
        visit signup_path
        click_button('Guest Login')
        fill_in "guest_username_area", :with => 'guestuser'
        click_button('Login as Guest')
        visit chatrooms_path
        fill_in "chatroom[roomname]",   :with => 'TestName'
        click_button('Create Chatroom')

        click_button('.helpbutton')
        assert_response :redirect
    end

    test "Clicking a button with Greek letters will enter the symbol into the message area" do
        visit signup_path
        click_button('Guest Login')
        fill_in "guest_username_area", :with => 'guestuser'
        click_button('Login as Guest')
        visit chatrooms_path
        fill_in "chatroom[roomname]",   :with => 'TestName'
        click_button('Create Chatroom')

        select 'Greek Letters', :from => "organizationSelect"
        first('.mathButton#chatMathMenuButton').click
        assert "#message_content".has_content("$")
        assert "#mathTyping".has_css?(".katex")
    end

    test "Query this message in Wolfram Alpha" do
        visit signup_path
        click_button('Guest Login')
        fill_in "guest_username_area", :with => 'guestuser'
        click_button('Login as Guest')
        visit chatrooms_path
        fill_in "chatroom[roomname]",   :with => 'TestName'
        click_button('Create Chatroom')

        find(".wolframAlphaLink").click_button
        assert page.has_content?('WolframAlpha Information')
        page.should have_content?("View in WolframAlpha")
        assert page.has_content?('Received and computing...')
    end

    test "Be redirected to other online math applications" do
        visit signup_path
        click_button('Guest Login')
        fill_in "guest_username_area", :with => 'guestuser'
        click_button('Login as Guest')
        visit chatrooms_path
        fill_in "chatroom[roomname]",   :with => 'TestName'
        click_button('Create Chatroom')

        find(".wolframAlphaLink").click_button
        assert page.has_content?('WolframAlpha Information')
        page.should have_content?("View in WolframAlpha")
        assert page.has_content?('Received and computing...')
        find("#viewWolfram").click_button
        assert_response :redirect
    end
end
