class DealController < ApplicationController

	get '/deals' do
        if logged_in?
		    erb :'deals/all_deals'
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
		@deal = current_user.deals.create(
						                 importance_rate: params[:deal][:importance_rate],
					                     title: params[:deal][:title],
					                     starting_date: params[:deal][:starting_date],
					                     link: params[:deal][:link],
					                     content: params[:deal][:content],
					                     category_id: params[:deal][:category_id])
		@deal.category = Category.create(params[:category]) unless params[:category][:name].empty?

		if @deal.save
			redirect to "/deals/#{@deal.id}"
		else
			redirect to '/deals/new'
		end
	end

	get '/deals/:id' do
	    if logged_in?        
		    @deal = Deal.find_by_id(params[:id])
			if current_user.deal_ids.include?(@deal.id)
			  erb :'deals/show'
			else
				redirect to '/deals'
			end
		else
			redirect to '/login'
		end	  
	end

	get '/deals/:id/edit' do
	  if logged_in?        
		    @deal = Deal.find_by_id(params[:id])
			if current_user.deal_ids.include?(@deal.id)
			  erb :'deals/edit'
			else
				redirect to '/deals'
			end
		else
			redirect to '/login'
		end
	end

    patch '/deals/:id' do
    end









end