require "test_helper"

class Public::GroupApprovalsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_group_approvals_new_url
    assert_response :success
  end

  test "should get create" do
    get public_group_approvals_create_url
    assert_response :success
  end
end
