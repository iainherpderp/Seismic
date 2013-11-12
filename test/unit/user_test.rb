require 'test_helper'

class UserTest < ActiveSupport::TestCase
<<<<<<< HEAD
  # test "the truth" do
  #   assert true
  # end
=======
  test "is password hashed" do
    u = User.new
    hashed_pass = Digest::SHA2.hexdigest('user_pass')
    stored_pass = u.password
    assert hashed_pass == stored_pass
  end
>>>>>>> baf625bd0d85a75bb01d9792d742610b79684b57
end
