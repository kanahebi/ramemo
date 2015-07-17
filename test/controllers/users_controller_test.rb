require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get following" do
    get :following
    assert_response :success
  end

  test "should get followers" do
    get :followers
    assert_response :success
  end

end
