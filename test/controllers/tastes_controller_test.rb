require 'test_helper'

class TastesControllerTest < ActionController::TestCase
  setup do
    @taste = tastes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tastes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create taste" do
    assert_difference('Taste.count') do
      post :create, taste: { name: @taste.name }
    end

    assert_redirected_to taste_path(assigns(:taste))
  end

  test "should show taste" do
    get :show, id: @taste
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @taste
    assert_response :success
  end

  test "should update taste" do
    patch :update, id: @taste, taste: { name: @taste.name }
    assert_redirected_to taste_path(assigns(:taste))
  end

  test "should destroy taste" do
    assert_difference('Taste.count', -1) do
      delete :destroy, id: @taste
    end

    assert_redirected_to tastes_path
  end
end
