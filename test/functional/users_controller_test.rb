require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get new" do
    # Written by Liam
    get :new
    assert_response :success
  end

  test "should get create" do
    # Written by Liam
    get :create
    assert_response :success
  end

  test "should get login" do
    # Written by Liam
    get :login
    assert_response :success
  end

 test "should get logout" do
    get :logout
    assert_response :redirect
  end

 test "logging out should set users id to nil" do
    # Written by Liam
    get :logout
    assert_nil session[:user_id]
 end

end
