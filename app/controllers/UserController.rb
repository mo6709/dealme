class UserController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect to '/deals'
    else
      erb :'users/create_user'
    end
     
  end

  post '/signup' do
    if User.available_username_or_email(params)
    	@user = User.new(username: params[:username], password: params[:password], email: params[:email])
    	if @user.save 
    		session[:user_id] = @user.id
    		flash[:message] = "User were created successfully" 
    		redirect to '/deals'
    	else
    		flash[:message] = "User can't be created, please fill up all the fields"
    		redirect to '/signup'
    	end
    else 
      flash[:message] = "Email or Username has already been taken"
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
      erb :'users/edit'
    else
      redirect to '/login'
    end
  end

  post '/users/edit' do
    if logged_in?
      if params[:password] && current_user.change_password(params)
        current_user.update(username: params[:username], password: params[:password], email: params[:password])
        flash[:message] = "You have successfully updated your user info and password"
      elsif if current.username != params[:username] || current_user.email != params[:email]
        current_user.update(username: params[:username], email: params[:email])
        flash[:message] = "You have successfully updated your info"
      else
        flash[:message] = "Sorry, something went wrong. Please go back to update your info"
        redirect '/users/edit'
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