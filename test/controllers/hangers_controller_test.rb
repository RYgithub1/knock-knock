require 'test_helper'

class HangersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get hangers_create_url
    assert_response :success
  end

  test "should get destroy" do
    get hangers_destroy_url
    assert_response :success
  end

end
