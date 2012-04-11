require 'test_helper'

class UserKnowledgeStatesControllerTest < ActionController::TestCase
  setup do
    @user_knowledge_state = user_knowledge_states(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_knowledge_states)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_knowledge_state" do
    assert_difference('UserKnowledgeState.count') do
      post :create, user_knowledge_state: @user_knowledge_state.attributes
    end

    assert_redirected_to user_knowledge_state_path(assigns(:user_knowledge_state))
  end

  test "should show user_knowledge_state" do
    get :show, id: @user_knowledge_state.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_knowledge_state.to_param
    assert_response :success
  end

  test "should update user_knowledge_state" do
    put :update, id: @user_knowledge_state.to_param, user_knowledge_state: @user_knowledge_state.attributes
    assert_redirected_to user_knowledge_state_path(assigns(:user_knowledge_state))
  end

  test "should destroy user_knowledge_state" do
    assert_difference('UserKnowledgeState.count', -1) do
      delete :destroy, id: @user_knowledge_state.to_param
    end

    assert_redirected_to user_knowledge_states_path
  end
end
