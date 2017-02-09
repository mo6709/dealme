class Deal < ActiveRecord::Base
	has_many :user_deals
	has_many :users, through: :user_deals
	belongs_to :category
    validates_presence_of :title, :link, :on => :create 
    validates_presence_of :title, :link, :category  
    def rating
    	case self.importance_rate.to_i
    	when 0..20 then "ok"
        when 20..40 then "good"
        when 40..60 then "great"	
    	when 60..80 then "super great"
    	when 80..100 then "HOT!"
    	end
    end

    def slug
    	self.title.downcase.gsub(" ", "-")
    end

    def self.find_by_slug(slug)
    	deal = self.all.find{|item| item.slug == slug}
    end
end