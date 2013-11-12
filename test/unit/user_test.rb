require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save user without password" do
    post = User.new
    assert !User.save, "Saved the user without a password"
  end
end
