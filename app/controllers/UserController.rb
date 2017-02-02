class UserController < ApplicationController

  get '/signup' do
     erb :'regestrations/signup'
  end

  post '/signup' do
  	@user = User.new(username: params[:username], password: params[:password], email: params[:email])
  	if @user.save 
  		session[:user_id] = @user.id
  		# flash[:message] = 
  		redirect to '/deals'
  	else
  		# flash[:message] =
  		redirect to '/signup'
  	end
  end



  get '/login' do 	
  	if logged_in?
      redirect to '/deals'  
  	else
      erb :'regestrations/login'		
  	end
  end

  post '/login' do
  	@user = User.find_by(username: params[:username])
  	if @user && @user.authenticate(params[:password])
  		# flash[:message]
  		redirect to '/deals'
  	else
        # flash[:message]
        redirect to '/login'
  	end 
  end

end