require "test_helper"

class StaticControllerTest < ActionDispatch::IntegrationTest
  test "should get pricing" do
    get static_pricing_url
    assert_response :success
  end
end
