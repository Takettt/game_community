require "test_helper"

class GroupPlayersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get group_players_create_url
    assert_response :success
  end

  test "should get destroy" do
    get group_players_destroy_url
    assert_response :success
  end
end
