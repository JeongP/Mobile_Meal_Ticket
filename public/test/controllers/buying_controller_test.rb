require 'test_helper'

class BuyingControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get buying_create_url
    assert_response :success
  end

  test "should get destroy" do
    get buying_destroy_url
    assert_response :success
  end

end
