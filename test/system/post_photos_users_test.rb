require "application_system_test_case"

class PostPhotosUsersTest < ApplicationSystemTestCase
  setup do
    @post_photos_user = post_photos_users(:one)
  end

  test "visiting the index" do
    visit post_photos_users_url
    assert_selector "h1", text: "Post Photos Users"
  end

  test "creating a Post photos user" do
    visit post_photos_users_url
    click_on "New Post Photos User"

    fill_in "Post photo", with: @post_photos_user.post_photo_id
    fill_in "User", with: @post_photos_user.user_id
    fill_in "Vote photos", with: @post_photos_user.vote_photos
    click_on "Create Post photos user"

    assert_text "Post photos user was successfully created"
    click_on "Back"
  end

  test "updating a Post photos user" do
    visit post_photos_users_url
    click_on "Edit", match: :first

    fill_in "Post photo", with: @post_photos_user.post_photo_id
    fill_in "User", with: @post_photos_user.user_id
    fill_in "Vote photos", with: @post_photos_user.vote_photos
    click_on "Update Post photos user"

    assert_text "Post photos user was successfully updated"
    click_on "Back"
  end

  test "destroying a Post photos user" do
    visit post_photos_users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Post photos user was successfully destroyed"
  end
end
