require 'test_helper'

class MerchantUsersControllerTest < ActionController::TestCase
  setup do
    @merchant_user = merchant_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:merchant_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create merchant_user" do
    assert_difference('MerchantUser.count') do
      post :create, merchant_user: {  }
    end

    assert_redirected_to merchant_user_path(assigns(:merchant_user))
  end

  test "should show merchant_user" do
    get :show, id: @merchant_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @merchant_user
    assert_response :success
  end

  test "should update merchant_user" do
    put :update, id: @merchant_user, merchant_user: {  }
    assert_redirected_to merchant_user_path(assigns(:merchant_user))
  end

  test "should destroy merchant_user" do
    assert_difference('MerchantUser.count', -1) do
      delete :destroy, id: @merchant_user
    end

    assert_redirected_to merchant_users_path
  end
end
