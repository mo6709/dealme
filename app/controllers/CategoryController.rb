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
		    erb :'categories/show_category'
		else
			redirect to '/'
		end
	end

end