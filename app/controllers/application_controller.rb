require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "dealme_secret"
  end

  get "/" do
    erb :welcome
  end

  helpers do
    def logged_in?
      !!session[:user_id] 	
    end 

    def current_user
     	User.find_by_id(session[:user_id])
    end

    def change_password
      user = current_user
      if user && (user.authenticate(params[:previous_password])) && (params[:password] == params[:password1])
        binding.pry
        user.password = params[:password]
      end
    end  
  end

end
