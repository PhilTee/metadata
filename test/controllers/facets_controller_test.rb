require 'test_helper'

class FacetsControllerTest < ActionController::TestCase
  setup do
    @facet = facets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:facets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create facet" do
    assert_difference('Facet.count') do
      post :create, facet: {  }
    end

    assert_redirected_to facet_path(assigns(:facet))
  end

  test "should show facet" do
    get :show, id: @facet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @facet
    assert_response :success
  end

  test "should update facet" do
    patch :update, id: @facet, facet: {  }
    assert_redirected_to facet_path(assigns(:facet))
  end

  test "should destroy facet" do
    assert_difference('Facet.count', -1) do
      delete :destroy, id: @facet
    end

    assert_redirected_to facets_path
  end
end
