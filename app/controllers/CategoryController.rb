class CategoryController < ApplicationController
	get '/categories' do
		erb :'categories/index'
	end 

	get '/categories/:slug' do
		erb :'categories/show_category'
	end

end