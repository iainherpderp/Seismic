require 'test_helper'

class SeismicIndexControllerTest < ActionController::TestCase
  # Written by Liam
	test "should assign @quake_data" do
		get "index"
		assert_not_nil assigns(:quake_data)

		assert_response :success
		#assert assert(:quake_data).class == "Hash", "did not not return a Hash: #{:quake_data.class}"
	end

	test "should assign @latest_quake" do
    # Written by Liam
		get "index"
		assert_not_nil assigns(:quake_data)

		assert_response :success
		#assert assert(:quake_data).class == "Hash", "did not not return a Hash: #{:quake_data.class}"
	end

end
