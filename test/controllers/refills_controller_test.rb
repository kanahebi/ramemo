require 'test_helper'

class RefillsControllerTest < ActionController::TestCase
  setup do
    @refill = refills(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:refills)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create refill" do
    assert_difference('Refill.count') do
      post :create, refill: { name: @refill.name }
    end

    assert_redirected_to refill_path(assigns(:refill))
  end

  test "should show refill" do
    get :show, id: @refill
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @refill
    assert_response :success
  end

  test "should update refill" do
    patch :update, id: @refill, refill: { name: @refill.name }
    assert_redirected_to refill_path(assigns(:refill))
  end

  test "should destroy refill" do
    assert_difference('Refill.count', -1) do
      delete :destroy, id: @refill
    end

    assert_redirected_to refills_path
  end
end
