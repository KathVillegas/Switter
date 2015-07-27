class User < ActiveRecord::Base
	#associations
	has_many :post
	has_many :status
	has_many :comment, class_name: "Post", through: :status
	#securing the password
	has_secure_password

	#signup validation
	validates :username, :password_confirmation, :presence => true
	validates :username, :uniqueness => true
end
