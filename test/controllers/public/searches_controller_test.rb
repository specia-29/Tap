require "test_helper"

class Public::SearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get user_search" do
    get public_searches_user_search_url
    assert_response :success
  end

  test "should get article_search" do
    get public_searches_article_search_url
    assert_response :success
  end
end
