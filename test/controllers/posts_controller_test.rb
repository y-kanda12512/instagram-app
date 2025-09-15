# test/controllers/posts_controller_test.rb
require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  fixtures :users, :posts

  setup do
    @user = users(:one)
    @user.create_profile!(nickname: "Test User") unless @user.profile
    sign_in @user
    @post = posts(:hello)
  end

  test "GET index" do
    get posts_url
    assert_response :success
  end

  test "GET new" do
    get new_post_url
    assert_response :success
  end

  test "GET show" do
    get post_url(@post)
    assert_response :success
  end

  test "GET edit" do
    get edit_post_url(@post)
    assert_response :success
  end

  test "POST create" do
    assert_difference("Post.count", 1) do
      post posts_url, params: { post: { content: "hi" } }
    end
    assert_redirected_to profile_url
  end

  test "PATCH update" do
    patch post_url(@post), params: { post: { content: "updated" } }
    assert_redirected_to profile_url
  end

  test "DELETE destroy" do
    assert_difference("Post.count", -1) { delete post_url(@post) }
    assert_redirected_to posts_url
  end
end
