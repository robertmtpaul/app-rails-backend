require 'test_helper'

class PostsUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @posts_user = posts_users(:one)
  end

  test "should get index" do
    get posts_users_url
    assert_response :success
  end

  test "should get new" do
    get new_posts_user_url
    assert_response :success
  end

  test "should create posts_user" do
    assert_difference('PostsUser.count') do
      post posts_users_url, params: { posts_user: { post_id: @posts_user.post_id, user_id: @posts_user.user_id, vote_post: @posts_user.vote_post } }
    end

    assert_redirected_to posts_user_url(PostsUser.last)
  end

  test "should show posts_user" do
    get posts_user_url(@posts_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_posts_user_url(@posts_user)
    assert_response :success
  end

  test "should update posts_user" do
    patch posts_user_url(@posts_user), params: { posts_user: { post_id: @posts_user.post_id, user_id: @posts_user.user_id, vote_post: @posts_user.vote_post } }
    assert_redirected_to posts_user_url(@posts_user)
  end

  test "should destroy posts_user" do
    assert_difference('PostsUser.count', -1) do
      delete posts_user_url(@posts_user)
    end

    assert_redirected_to posts_users_url
  end
end
