require 'test_helper'

class TsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @t = ts(:one)
  end

  test "should get index" do
    get ts_url
    assert_response :success
  end

  test "should get new" do
    get new_t_url
    assert_response :success
  end

  test "should create t" do
    assert_difference('T.count') do
      post ts_url, params: { t: { title: @t.title } }
    end

    assert_redirected_to t_url(T.last)
  end

  test "should show t" do
    get t_url(@t)
    assert_response :success
  end

  test "should get edit" do
    get edit_t_url(@t)
    assert_response :success
  end

  test "should update t" do
    patch t_url(@t), params: { t: { title: @t.title } }
    assert_redirected_to t_url(@t)
  end

  test "should destroy t" do
    assert_difference('T.count', -1) do
      delete t_url(@t)
    end

    assert_redirected_to ts_url
  end
end
