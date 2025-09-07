require "test_helper"

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get profiles_new_url
    assert_response :success
  end

  test "should get show" do
    get profiles_show_url
    assert_response :success
  end

  test "should get edit" do
    get profiles_edit_url
    assert_response :success
  end

  test "should get update" do
    get profiles_update_url
    assert_response :success
  end

  setup do
    @user = users(:one)
    sign_in @user
    @user.create_profile!(nickname: "Tester") # show/edit/update がプロフィール前提なら
  end
end
