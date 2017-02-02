class DealController < ApplicationController

	get '/deals' do
		erb :'deals/index'
	end

end