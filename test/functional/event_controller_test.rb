require 'test_helper'

class EventControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get current" do
    get :current
    assert_response :success
  end

end
