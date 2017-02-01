class User < ActiveRecord::Base
	has_secure_password
	has_many :user_deals
	has_many :deals, through: :user_deals
	validates_presence_of :username, :password, :email 
end