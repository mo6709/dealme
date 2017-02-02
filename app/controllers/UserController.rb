class UserController < ApplicationController

  get '/signup' do
     erb :'regestrations/signup'
  end

  post '/signup' do
  	
  	@user = User.new(username: params[:username], password: params[:password], email: params[:email])
  	if @user.save 
  		session[:user_id] = @user.id
  		binding.pry
  		redirect to '/deals'
  	else
  		redirect to '/signup'
  	end
  end

  get '/login' do
  	erb :'regestrations/login'
  end

  post '/login' do
  	"hello"
  end

end