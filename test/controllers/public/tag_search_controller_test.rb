require "test_helper"

class Public::TagSearchControllerTest < ActionDispatch::IntegrationTest
  test "should get tag_search" do
    get public_tag_search_tag_search_url
    assert_response :success
  end
end
