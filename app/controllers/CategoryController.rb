class CategoryController < ApplicationController
	get '/categories' do
		if logged_in?
		    erb :'categories/all_categories'
	    else
	    	redirect to '/'
	    end
	end 

	get '/categories/:slug' do
		if logged_in?
			@category = Category.find_by_slug(params[:slug])
			@category_deals = current_user.deals.collect{ |deal| deal if @category.deals.include?(deal)}
		    erb :'categories/show_category'
		else
			redirect to '/'
		end
	end

end