require 'test_helper'

class UserLectureListensControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_lecture_listens_create_url
    assert_response :success
  end

  test "should get destroy" do
    get user_lecture_listens_destroy_url
    assert_response :success
  end

  test "should get index" do
    get user_lecture_listens_index_url
    assert_response :success
  end

end
