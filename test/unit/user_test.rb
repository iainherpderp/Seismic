require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save user without password" do
    # Written by Liam
    post = User.new(username: 'test1')
    assert !post.save, "Saved the user without a password"
  end

  test "should not save user without username" do
    # Written by Chris
    post = User.new(password: 'test', password_confirmation: 'test')
    assert !post.save, "Saved the user without a username"
  end

  test "should not save user with mismatched password confirmation" do
    # Written by Chris
    post = User.new(username: 'test2', password: 'test', password_confirmation: 'notest')
    assert !post.save, "Saved the user without a matched password confirmation"
  end


end
