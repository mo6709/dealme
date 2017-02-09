class DealController < ApplicationController

	get '/deals' do
        if logged_in? && !current_user.deals.empty?
		    erb :'deals/all_deals'
	    else
	    	flash[:message] = "Please login"
	    	redirect to '/'
	    end
	end

	get '/deals/new' do
		if logged_in?
			erb :'deals/new_deal'
		else
			flash[:message] = "Please login"
			redirect to '/'
		end
	end

	post '/deals' do
		@deal = current_user.deals.create(
						                 importance_rate: params[:deal][:importance_rate],
					                     title: params[:deal][:title],
					                     starting_date: params[:deal][:starting_date],
					                     experation_date: params[:deal][:experation_date],
					                     link: params[:deal][:link],
					                     content: params[:deal][:content],
					                     category_id: params[:deal][:category_id])
		@deal.category = Category.new(params[:category]) unless params[:category][:name].empty?

		if @deal.save
			flash[:message] = "The deal was created successfully"
			redirect to "/deals/#{@deal.id}"
		else
			flash[:message] = "The deal was NOT created, try again"
			redirect to '/deals/new'
		end
	end

	get '/deals/:id' do
	    if logged_in?        
		    @deal = Deal.find_by_id(params[:id])
			if @deal && current_user.deal_ids.include?(@deal.id)
			  erb :'deals/show'
			else
				flash[:message] = "Please make sure this deal belongs to you"
				redirect to '/deals'
			end
		else
			flash[:message] = "Please login"
			redirect to '/'
		end	  
	end

	get '/deals/:id/edit' do
	  if logged_in?        
		    @deal = Deal.find_by_id(params[:id])
			if current_user.deal_ids.include?(@deal.id)
			  erb :'deals/edit'
			else
				flash[:message] = "Please make sure this deal belongs to you"
				redirect to '/deals'
			end
		else
			flash[:message] = "Please login"
			redirect to '/'
		end
	end

    patch '/deals/:id' do
    	if logged_in?
    		@deal = Deal.find_by_id(params[:id])
    		@deal.title = params[:deal][:title] 
    		@deal.importance_rate = params[:deal][:importance_rate]
    		@deal.starting_date = params[:deal][:starting_date]
    		@deal.experation_date = params[:deal][:experation_date]
    		@deal.link = params[:deal][:link]
    		@deal.content = params[:deal][:content]
    		@deal.category_id = params[:deal][:category_id]


    		@deal.category = Category.new(name: params[:category][:name]) unless params[:category][:name].empty?

            if @deal.save
              flash[:message] = "You have successfully updated the deal"
              redirect to '/deals'
            else
            	flash[:message] = "Changes did NOT applayed, please try again"
            	redirect to "/deals/#{@deal.id}"
            end    
    	else
    		flash[:message] = "Please login"
    		redirect to '/'
    	end
    end

    delete '/deals/:id/delete' do 
    	if @deal = current_user.deals.find_by_id(params[:id])
    		 flash[:message] = "The deal was successfully deleted"
             Deal.delete(params[:id])
             redirect to '/deals'
    	else
    		flash[:message] = "Please make sure this deal belongs to you"
    		redirect to '/deals'
    	end
    end

end