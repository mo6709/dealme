class Deal < ActiveRecord::Base
	has_many :user_deals
	has_many :users, through: :user_deals
	belongs_to :category
end