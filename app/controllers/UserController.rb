class UserController < ApplicationController

  get '/signup' do
     erb :'regestrations/signup'
  end

  post '/signup' do
  	@user = User.new(params)
  	if @user.save 
  		session[:user_id] = @user.id
  		redirect to '/deals'
  	else
  		redirect to '/signup'
  	end
  end

  get '/login' do
  	erb :'regestrations/login'
  end

  post '/login' do
  end

end