require 'test_helper'

class InventoryManagementControllerTest < ActionController::TestCase
  test "should get recipes" do
    get :recipes
    assert_response :success
  end

  test "should get ingredients" do
    get :ingredients
    assert_response :success
  end

  test "should get equipment" do
    get :equipment
    assert_response :success
  end

end
