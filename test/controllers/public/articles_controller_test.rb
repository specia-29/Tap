require "test_helper"

class Public::ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get public_articles_top_url
    assert_response :success
  end

  test "should get new" do
    get public_articles_new_url
    assert_response :success
  end

  test "should get create" do
    get public_articles_create_url
    assert_response :success
  end

  test "should get show" do
    get public_articles_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_articles_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_articles_update_url
    assert_response :success
  end

  test "should get destroy" do
    get public_articles_destroy_url
    assert_response :success
  end

  test "should get like" do
    get public_articles_like_url
    assert_response :success
  end
end
