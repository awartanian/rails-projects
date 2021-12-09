require "test_helper"

class TeamLeadUserControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get team_lead_user_create_url
    assert_response :success
  end

  test "should get destroy" do
    get team_lead_user_destroy_url
    assert_response :success
  end
end
