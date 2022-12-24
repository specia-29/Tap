require "test_helper"

class Public::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_users_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_users_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_users_update_url
    assert_response :success
  end

  test "should get followed" do
    get public_users_followed_url
    assert_response :success
  end

  test "should get follower" do
    get public_users_follower_url
    assert_response :success
  end

  test "should get stat_update" do
    get public_users_stat_update_url
    assert_response :success
  end
end
