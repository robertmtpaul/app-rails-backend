require "application_system_test_case"

class PostsUsersTest < ApplicationSystemTestCase
  setup do
    @posts_user = posts_users(:one)
  end

  test "visiting the index" do
    visit posts_users_url
    assert_selector "h1", text: "Posts Users"
  end

  test "creating a Posts user" do
    visit posts_users_url
    click_on "New Posts User"

    fill_in "Post", with: @posts_user.post_id
    fill_in "User", with: @posts_user.user_id
    fill_in "Vote post", with: @posts_user.vote_post
    click_on "Create Posts user"

    assert_text "Posts user was successfully created"
    click_on "Back"
  end

  test "updating a Posts user" do
    visit posts_users_url
    click_on "Edit", match: :first

    fill_in "Post", with: @posts_user.post_id
    fill_in "User", with: @posts_user.user_id
    fill_in "Vote post", with: @posts_user.vote_post
    click_on "Update Posts user"

    assert_text "Posts user was successfully updated"
    click_on "Back"
  end

  test "destroying a Posts user" do
    visit posts_users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Posts user was successfully destroyed"
  end
end
