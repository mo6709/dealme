class CategoryController < ApplicationController
	get '/categories' do
		erb :'categories/all_categories'
	end 

	get '/categories/:slug' do
		erb :'categories/show_category'
	end

end