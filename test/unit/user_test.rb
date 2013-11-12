require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "is password hashed" do
    u = User.new
    hashed_pass = Digest::SHA2.hexdigest('user_pass')
    stored_pass = u.password
    assert hashed_pass == stored_pass
  end
end
