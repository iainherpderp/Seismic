class User < ActiveRecord::Base
  attr_accessible :email, :isadmin, :password_hash, :password_salt, :username
end
