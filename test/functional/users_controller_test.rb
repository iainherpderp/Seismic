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
   # Written by Liam
    get :logout
    assert_response :redirect
  end

 test "logging out should set users id to nil" do
   # Written by Liam
    get :logout
    assert_nil session[:user_id]
  end

  test "Accessing user_page while signed out redirects to login" do
	get :user_page									#Iain Macdonald
	assert_response :redirect
  end

  test "Non admins cannot access the admin page" do
	get :admin										#Iain Macdonald
  assert_response :redirect
  end


end
