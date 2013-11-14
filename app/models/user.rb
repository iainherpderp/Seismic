#By Iain Macdonald (Minus final version of def isadmin)

class User < ActiveRecord::Base

  attr_accessible :username, :email, :password_hash, :password_salt, :password, :password_confirmation, :isadmin, :default => false

  attr_accessor :password, :password_confirmation, :isadmin

  before_save :encrypt_password

  validates_presence_of :username

  validates_uniqueness_of :username

  validates_confirmation_of :password

  validates_presence_of :password, :on => :create

  validates_uniqueness_of :email

  validates :email, email_format: {message: "please enter a valid e-mail address!"}
  
	def isadmin
		username == "IainAdmin"
	end

	def encrypt_password

		if password.present?

			self.password_salt = BCrypt::Engine.generate_salt

			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)

		end

	end

	def self.authenticate(username, password)
		user = find_by_username(username)
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user
		else
			nil
		end
	end

end
