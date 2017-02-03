class DealController < ApplicationController

	get '/deals' do
        if logged_in?
		    erb :'deals/index'
	    else
	    	redirect ot '/login'
	    end
	end

	get '/deals/new' do
		if logged_in?
			erb :'deals/new_deal'
		else
			redirect to '/login'
		end
	end

	post '/deals' do 
		
		@deal = Deal.create(
			                 importance_rate: params[:deal][:importance_rate],
		                     title: params[:deal][:title],
		                     starting_date: params[:deal][:starting_date],
		                     experation_date: params[:deal][:experation_date],
		                     link: params[:deal][:link],
		                     content: params[:deal][:content],
		                     category_id: params[:deal][:category_id])
		@deal.category= Category.create(params[:category]) unless params[:category][:name].empty?

		if @deal.save
			redirect to "/deals/#{@deal.slug}"
		else
			redirect to '/deals/new'
		end
	end

	get '/deals/:slug' do
        deal = Deal.find_by_slug(params[:slug])
		erb :'deals/show'
	end

end