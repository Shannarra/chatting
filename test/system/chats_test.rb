require "application_system_test_case"

class ChatsTest < ApplicationSystemTestCase
  setup do
    @chat = chats(:one)
    @user = @chat.users.first
  end

  test "visiting the index" do
    visit_wrapped chats_url

    @user.chats.count do |chat|
      assert_selector "div" do
        assert_selector "a"
      end
    end

    assert_selector "h1", text: "Chats"
  end

  test "should create chat" do
    visit_wrapped chats_url

    click_on "New chat"

    fill_in "Name", with: @chat.name
    click_on "Create Chat"

    assert_text "Chat was successfully created"
    click_on "Back"
  end

  test "should update Chat" do
    visit_wrapped chat_url(@chat)

    click_on "Edit this chat", match: :first

    fill_in "Name", with: @chat.name + " changed!"
    click_on "Update Chat"

    assert_text "Chat was successfully updated"
    click_on "Back"

    visit chat_url(@chat)
  end

  test "should destroy Chat" do
    visit_wrapped chat_url(@chat)

    click_on "Destroy this chat", match: :first

    assert_text "Chat was successfully destroyed"
  end
end
