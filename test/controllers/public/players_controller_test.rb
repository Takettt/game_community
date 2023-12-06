require "test_helper"

class Public::PlayersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_players_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_players_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_players_update_url
    assert_response :success
  end

  test "should get confirm" do
    get public_players_confirm_url
    assert_response :success
  end

  test "should get leave" do
    get public_players_leave_url
    assert_response :success
  end
end
