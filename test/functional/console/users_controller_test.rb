require 'test_helper'

class Console::UsersControllerTest < ActionController::TestCase
  setup do
    @console_user = console_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:console_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create console_user" do
    assert_difference('Console::User.count') do
      post :create, console_user: {  }
    end

    assert_redirected_to console_user_path(assigns(:console_user))
  end

  test "should show console_user" do
    get :show, id: @console_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @console_user
    assert_response :success
  end

  test "should update console_user" do
    put :update, id: @console_user, console_user: {  }
    assert_redirected_to console_user_path(assigns(:console_user))
  end

  test "should destroy console_user" do
    assert_difference('Console::User.count', -1) do
      delete :destroy, id: @console_user
    end

    assert_redirected_to console_users_path
  end
end
