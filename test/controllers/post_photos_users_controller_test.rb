require 'test_helper'

class PostPhotosUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post_photos_user = post_photos_users(:one)
  end

  test "should get index" do
    get post_photos_users_url
    assert_response :success
  end

  test "should get new" do
    get new_post_photos_user_url
    assert_response :success
  end

  test "should create post_photos_user" do
    assert_difference('PostPhotosUser.count') do
      post post_photos_users_url, params: { post_photos_user: { post_photo_id: @post_photos_user.post_photo_id, user_id: @post_photos_user.user_id, vote_photos: @post_photos_user.vote_photos } }
    end

    assert_redirected_to post_photos_user_url(PostPhotosUser.last)
  end

  test "should show post_photos_user" do
    get post_photos_user_url(@post_photos_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_photos_user_url(@post_photos_user)
    assert_response :success
  end

  test "should update post_photos_user" do
    patch post_photos_user_url(@post_photos_user), params: { post_photos_user: { post_photo_id: @post_photos_user.post_photo_id, user_id: @post_photos_user.user_id, vote_photos: @post_photos_user.vote_photos } }
    assert_redirected_to post_photos_user_url(@post_photos_user)
  end

  test "should destroy post_photos_user" do
    assert_difference('PostPhotosUser.count', -1) do
      delete post_photos_user_url(@post_photos_user)
    end

    assert_redirected_to post_photos_users_url
  end
end
