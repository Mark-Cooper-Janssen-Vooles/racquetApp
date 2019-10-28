require 'test_helper'

class UserDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_detail = user_details(:one)
  end

  test "should get index" do
    get user_details_url
    assert_response :success
  end

  test "should get new" do
    get new_user_detail_url
    assert_response :success
  end

  test "should create user_detail" do
    assert_difference('UserDetail.count') do
      post user_details_url, params: { user_detail: { description: @user_detail.description, location_id: @user_detail.location_id, name: @user_detail.name, shopping_cart_id: @user_detail.shopping_cart_id, type: @user_detail.type, user_id: @user_detail.user_id } }
    end

    assert_redirected_to user_detail_url(UserDetail.last)
  end

  test "should show user_detail" do
    get user_detail_url(@user_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_detail_url(@user_detail)
    assert_response :success
  end

  test "should update user_detail" do
    patch user_detail_url(@user_detail), params: { user_detail: { description: @user_detail.description, location_id: @user_detail.location_id, name: @user_detail.name, shopping_cart_id: @user_detail.shopping_cart_id, type: @user_detail.type, user_id: @user_detail.user_id } }
    assert_redirected_to user_detail_url(@user_detail)
  end

  test "should destroy user_detail" do
    assert_difference('UserDetail.count', -1) do
      delete user_detail_url(@user_detail)
    end

    assert_redirected_to user_details_url
  end
end
