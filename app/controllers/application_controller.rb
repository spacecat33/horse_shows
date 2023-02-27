class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

   
    def home
        @user = current_user
        if @user

        else
            redirect_to '/signin'
        end

    end

    def logged_in?
        !!current_user
    end

    def current_user
        if session[:user_id]
            @user = User.find_by_id(session[:user_id])
        end
        @user ||= User.find_by_id(session[:user_id]) if session[:user_id]   #this would help to avoid duplicate requests to the database
    end

end
