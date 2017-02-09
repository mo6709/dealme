class UserController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect to '/deals'
    else
      erb :'users/create_user'
    end
     
  end

  post '/signup' do
  	@user = User.new(username: params[:username], password: params[:password], email: params[:email])
  	if @user.save 
  		session[:user_id] = @user.id
  		flash[:message] = "User were created successfully" 
  		redirect to '/deals'
  	else
  		flash[:message] = "User can't be created, please fill up all the fields"
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
  		flash[:message] = "You are logged in succes sfully"
      session[:user_id] = @user.id
  		redirect to '/deals'
  	else
        flash[:message] = "Please try again"
        redirect to '/login'
  	end 
  end
  

  get '/users/edit' do
    if logged_in?
      @user = current_user
      erb :'users/edit'
    else
      redirect to '/login'
    end
  end

  post '/users/edit' do
    if logged_in?
      user = current_user
      user.username = params[:username] unless params[:username].empty?
      user.email = params[:email] unless params[:email].empty?
      change_password
      if user.save
        flash[:message] = "You have successfully updated your info"
      else
        flash[:message] = "Sorry, something went wrong. Please go back to update your info"
      end

      redirect '/deals'
    else
      flash[:message] = "Please login"
      redirect to '/login'
    end
  end
  
  get '/logout' do
    if logged_in?
        session.clear
        flash[:message] = "You have successfully logged out"
        redirect to '/'
    else
        flash[:message] = "Please login"
        redirect to '/'
    end
  end


  
end