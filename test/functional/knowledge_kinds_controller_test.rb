require 'test_helper'

class KnowledgeKindsControllerTest < ActionController::TestCase
  setup do
    @knowledge_kind = knowledge_kinds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:knowledge_kinds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create knowledge_kind" do
    assert_difference('KnowledgeKind.count') do
      post :create, knowledge_kind: @knowledge_kind.attributes
    end

    assert_redirected_to knowledge_kind_path(assigns(:knowledge_kind))
  end

  test "should show knowledge_kind" do
    get :show, id: @knowledge_kind.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @knowledge_kind.to_param
    assert_response :success
  end

  test "should update knowledge_kind" do
    put :update, id: @knowledge_kind.to_param, knowledge_kind: @knowledge_kind.attributes
    assert_redirected_to knowledge_kind_path(assigns(:knowledge_kind))
  end

  test "should destroy knowledge_kind" do
    assert_difference('KnowledgeKind.count', -1) do
      delete :destroy, id: @knowledge_kind.to_param
    end

    assert_redirected_to knowledge_kinds_path
  end
end
