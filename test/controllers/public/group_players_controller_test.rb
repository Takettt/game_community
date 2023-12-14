require "test_helper"

class Public::GroupPlayersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get public_group_players_create_url
    assert_response :success
  end

  test "should get destroy" do
    get public_group_players_destroy_url
    assert_response :success
  end
end
