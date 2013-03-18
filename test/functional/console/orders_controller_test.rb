require 'test_helper'

class Console::OrdersControllerTest < ActionController::TestCase
  setup do
    @console_order = console_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:console_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create console_order" do
    assert_difference('Console::Order.count') do
      post :create, console_order: {  }
    end

    assert_redirected_to console_order_path(assigns(:console_order))
  end

  test "should show console_order" do
    get :show, id: @console_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @console_order
    assert_response :success
  end

  test "should update console_order" do
    put :update, id: @console_order, console_order: {  }
    assert_redirected_to console_order_path(assigns(:console_order))
  end

  test "should destroy console_order" do
    assert_difference('Console::Order.count', -1) do
      delete :destroy, id: @console_order
    end

    assert_redirected_to console_orders_path
  end
end
