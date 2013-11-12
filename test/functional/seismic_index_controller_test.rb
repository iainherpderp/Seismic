require 'test_helper'

class SeismicIndexControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end	
	test "should set instanced variable @quakedata" do
		get :index
		assert_not_nil assigns(:quake_data)

		#assert_response :success
		assert :quake_data.class == "Hash", "did not not return a Hash: #{:quake_data.class}"
	end
  
	
end
