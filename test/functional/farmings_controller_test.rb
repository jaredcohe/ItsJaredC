require 'test_helper'

class FarmingsControllerTest < ActionController::TestCase
  setup do
    @farming = farmings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:farmings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create farming" do
    assert_difference('Farming.count') do
      post :create, farming: @farming.attributes
    end

    assert_redirected_to farming_path(assigns(:farming))
  end

  test "should show farming" do
    get :show, id: @farming.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @farming.to_param
    assert_response :success
  end

  test "should update farming" do
    put :update, id: @farming.to_param, farming: @farming.attributes
    assert_redirected_to farming_path(assigns(:farming))
  end

  test "should destroy farming" do
    assert_difference('Farming.count', -1) do
      delete :destroy, id: @farming.to_param
    end

    assert_redirected_to farmings_path
  end
end
