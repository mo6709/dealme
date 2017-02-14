class User < ActiveRecord::Base
	has_secure_password
	has_many :user_deals
	has_many :deals, through: :user_deals
	has_many :categories, through: :deals 
	validates :username, :email, presence: true
	# validates_presence_of :password, :on => :create
	# validation for password length
	validates :username, :email, uniqueness: true

	def slug
		self.username.downcase.gsub(" ","-")
	end

	def self.find_by_slug(slug)
		self.all.find{|item| item.slug == slug}
	end

	def valid_password_change?(params)
      self.authenticate(params[:previous_password]) && params[:password] == params[:password1]
    end

    def self.available_username_or_email?(params)
    	!(self.find_by(email: params[:email]) || self.find_by(username: params[:username]))
    end
end