require 'test_helper'

class BedroomsControllerTest < ActionController::TestCase
  setup do
    @bedroom = bedrooms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bedrooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bedroom" do
    assert_difference('Bedroom.count') do
      post :create, bedroom: { name: @bedroom.name }
    end

    assert_redirected_to bedroom_path(assigns(:bedroom))
  end

  test "should show bedroom" do
    get :show, id: @bedroom
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bedroom
    assert_response :success
  end

  test "should update bedroom" do
    patch :update, id: @bedroom, bedroom: { name: @bedroom.name }
    assert_redirected_to bedroom_path(assigns(:bedroom))
  end

  test "should destroy bedroom" do
    assert_difference('Bedroom.count', -1) do
      delete :destroy, id: @bedroom
    end

    assert_redirected_to bedrooms_path
  end
end
