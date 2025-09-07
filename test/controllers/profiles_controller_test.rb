require "test_helper"

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers  # ← Devise のサインイン用

  setup do
    @user = User.create!(email: "test@example.com", password: "password123")
    sign_in @user
  end

  test "GET new when no profile" do
    @user.profile&.destroy
    get new_profile_url
    assert_response :success
  end

  test "GET show" do
    @user.create_profile!(nickname: "Tester") unless @user.profile
    get profile_url
    assert_response :success
  end

  test "GET edit" do
    @user.create_profile!(nickname: "Tester") unless @user.profile
    get edit_profile_url
    assert_response :success
  end

  test "PATCH update" do
    @user.create_profile!(nickname: "Tester") unless @user.profile
    patch profile_url, params: { profile: { nickname: "New Nick" } }
    assert_redirected_to profile_url
    assert_equal "New Nick", @user.reload.profile.nickname
  end
end
