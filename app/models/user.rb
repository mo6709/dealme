class User < ActiveRecord::Base
	has_secure_password
	has_many :user_deals
	has_many :deals, through: :user_deals
	validates_presence_of :username, :email
	validates_presence_of :password, :on => :create

	def slug
		self.username.downcase.gsub(" ","-")
	end

	def self.find_by_slug(slug)
		self.all.find{|item| item.slug == slug}
	end
end