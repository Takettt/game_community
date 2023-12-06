require "test_helper"

class Public::CalendarsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_calendars_new_url
    assert_response :success
  end

  test "should get create" do
    get public_calendars_create_url
    assert_response :success
  end

  test "should get edit" do
    get public_calendars_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_calendars_update_url
    assert_response :success
  end

  test "should get destroy" do
    get public_calendars_destroy_url
    assert_response :success
  end
end
