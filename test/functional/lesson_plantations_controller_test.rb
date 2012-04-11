require 'test_helper'

class LessonPlantationsControllerTest < ActionController::TestCase
  setup do
    @lesson_plantation = lesson_plantations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lesson_plantations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lesson_plantation" do
    assert_difference('LessonPlantation.count') do
      post :create, lesson_plantation: @lesson_plantation.attributes
    end

    assert_redirected_to lesson_plantation_path(assigns(:lesson_plantation))
  end

  test "should show lesson_plantation" do
    get :show, id: @lesson_plantation.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lesson_plantation.to_param
    assert_response :success
  end

  test "should update lesson_plantation" do
    put :update, id: @lesson_plantation.to_param, lesson_plantation: @lesson_plantation.attributes
    assert_redirected_to lesson_plantation_path(assigns(:lesson_plantation))
  end

  test "should destroy lesson_plantation" do
    assert_difference('LessonPlantation.count', -1) do
      delete :destroy, id: @lesson_plantation.to_param
    end

    assert_redirected_to lesson_plantations_path
  end
end
