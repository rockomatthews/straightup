require 'test_helper'

class WalletsControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

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
