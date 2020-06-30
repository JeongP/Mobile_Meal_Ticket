require 'test_helper'

class UserLectureJjimsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_lecture_jjims_create_url
    assert_response :success
  end

  test "should get destroy" do
    get user_lecture_jjims_destroy_url
    assert_response :success
  end

end
