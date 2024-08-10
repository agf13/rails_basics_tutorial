require "test_helper"

class InstancesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get instances_index_url
    assert_response :success
  end

  test "should get help" do
    get instances_help_url
    assert_response :success
  end
end
