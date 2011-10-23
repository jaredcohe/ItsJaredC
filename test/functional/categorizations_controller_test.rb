require 'test_helper'

class CategorizationsControllerTest < ActionController::TestCase
  setup do
    @categorization = categorizations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categorizations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create categorization" do
    assert_difference('Categorization.count') do
      post :create, categorization: @categorization.attributes
    end

    assert_redirected_to categorization_path(assigns(:categorization))
  end

  test "should show categorization" do
    get :show, id: @categorization.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @categorization.to_param
    assert_response :success
  end

  test "should update categorization" do
    put :update, id: @categorization.to_param, categorization: @categorization.attributes
    assert_redirected_to categorization_path(assigns(:categorization))
  end

  test "should destroy categorization" do
    assert_difference('Categorization.count', -1) do
      delete :destroy, id: @categorization.to_param
    end

    assert_redirected_to categorizations_path
  end
end
