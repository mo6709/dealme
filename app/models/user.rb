class User < ActiveRecord::Base
	has_many :user_deals
	has_many :deals, through: :user_deals
end