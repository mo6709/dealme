class UserController < ApplicationController

  get '/signup' do
     erb :'users/create_user'
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
      erb :'users/login'		
  	end
  end

  post '/login' do
  	@user = User.find_by(username: params[:username])
  	if @user && @user.authenticate(params[:password])
  		# flash[:message]
      session[:user_id] = @user.id
  		redirect to '/deals'
  	else
        # flash[:message]
        redirect to '/login'
  	end 
  end
  


  








end