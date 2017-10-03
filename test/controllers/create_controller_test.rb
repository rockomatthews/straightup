require 'test_helper'

class CreateControllerTest < ActionController::TestCase
  test "should get deposit" do
    get :deposit
    assert_response :success
  end

  test "should get withdraw" do
    get :withdraw
    assert_response :success
  end

  test "should get send" do
    get :send
    assert_response :success
  end

end
