require "test_helper"

class JcformsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get jcforms_index_url
    assert_response :success
  end
end
