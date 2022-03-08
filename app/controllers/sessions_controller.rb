class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            session[:email] = @user[:email]
            redirect_to user_path(@user), :flash => { :success => "You have logged in successfully!" }
        else
            if @user[:email] == nil
                flash[:error] = "Do not recognize email. Please provide a valid email"
            else @user != nil && @user[:email] != ""
                flash[:error] = "Incorrect password provided"
            end
            render 'new'
        end
    end
end