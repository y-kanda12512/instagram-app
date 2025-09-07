require "test_helper"

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get profile_new_url
    assert_response :success
  end

  test "should get show" do
    get profile_show_url
    assert_response :success
  end

  test "should get edit" do
    get profile_edit_url
    assert_response :success
  end

  test "should get update" do
    get profile_update_url
    assert_response :success
  end

  setup do
    @user = users(:one)
    sign_in @user
    @user.create_profile!(nickname: "Tester") # show/edit/update がプロフィール前提なら
  end
end
