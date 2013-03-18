require 'test_helper'

class Console::ProductsControllerTest < ActionController::TestCase
  setup do
    @console_product = console_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:console_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create console_product" do
    assert_difference('Console::Product.count') do
      post :create, console_product: {  }
    end

    assert_redirected_to console_product_path(assigns(:console_product))
  end

  test "should show console_product" do
    get :show, id: @console_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @console_product
    assert_response :success
  end

  test "should update console_product" do
    put :update, id: @console_product, console_product: {  }
    assert_redirected_to console_product_path(assigns(:console_product))
  end

  test "should destroy console_product" do
    assert_difference('Console::Product.count', -1) do
      delete :destroy, id: @console_product
    end

    assert_redirected_to console_products_path
  end
end
