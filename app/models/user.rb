class User < ActiveRecord::Base
  attr_accessible :is_admin, :last_seen, :password, :username
end
