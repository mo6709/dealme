class Deal < ActiveRecord::Base
	has_many :user_deals
	has_many :users, through: :user_deals
	belongs_to :category
    validates_presence_of :title, :link
    
    def slug
    	title.downcase.gsub(" ", "-")
    end

    def self.find_by_slug(slug)
    	deal = self.all.find{|item| item.slug == slug}

    end
end