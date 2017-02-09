require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "dealme_secret"
  end
  
  use Rack::Flash 

  get "/" do
    erb :welcome
  end

  helpers do
    def logged_in?
      !!current_user	
    end 

    def current_user
     	current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def change_password
      user = current_user
      if user && (user.authenticate(params[:previous_password])) && (params[:password] == params[:password1])
        user.password = params[:password] unless params[:password].empty?
      end
    end  
  end

end
