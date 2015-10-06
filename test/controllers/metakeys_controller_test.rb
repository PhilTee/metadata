require 'test_helper'

class MetakeysControllerTest < ActionController::TestCase
  setup do
    @metakey = metakeys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:metakeys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create metakey" do
    assert_difference('Metakey.count') do
      post :create, metakey: {  }
    end

    assert_redirected_to metakey_path(assigns(:metakey))
  end

  test "should show metakey" do
    get :show, id: @metakey
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @metakey
    assert_response :success
  end

  test "should update metakey" do
    patch :update, id: @metakey, metakey: {  }
    assert_redirected_to metakey_path(assigns(:metakey))
  end

  test "should destroy metakey" do
    assert_difference('Metakey.count', -1) do
      delete :destroy, id: @metakey
    end

    assert_redirected_to metakeys_path
  end
end
