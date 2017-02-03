class DealController < ApplicationController

	get '/deals' do
        if logged_in?
		    erb :'deals/index'
	    else
	    	redirect ot '/login'
	    end
	end


end