require 'test_helper'

class SubcategorizationsControllerTest < ActionController::TestCase
  setup do
    @subcategorization = subcategorizations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subcategorizations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subcategorization" do
    assert_difference('Subcategorization.count') do
      post :create, subcategorization: @subcategorization.attributes
    end

    assert_redirected_to subcategorization_path(assigns(:subcategorization))
  end

  test "should show subcategorization" do
    get :show, id: @subcategorization.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subcategorization.to_param
    assert_response :success
  end

  test "should update subcategorization" do
    put :update, id: @subcategorization.to_param, subcategorization: @subcategorization.attributes
    assert_redirected_to subcategorization_path(assigns(:subcategorization))
  end

  test "should destroy subcategorization" do
    assert_difference('Subcategorization.count', -1) do
      delete :destroy, id: @subcategorization.to_param
    end

    assert_redirected_to subcategorizations_path
  end
end
