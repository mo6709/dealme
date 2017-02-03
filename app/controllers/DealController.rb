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
		
	end

end