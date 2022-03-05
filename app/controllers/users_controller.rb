class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
       @user = User.create(user_params)
       if @user.valid?
         session[:user_id] = @user.id
         redirect_to user_path(@user), :flash => { :success => "You have registered successfully" }
       else
         if user_params[:email] == ""
            flash[:error] = "Please provide an email address"
         elsif user_params[:password] == ""
            flash[:error] = "Please provide a password"
         elsif user_params[:password].length < 5
            flash[:error] = "Please provide a password with at least 5 characters"
         elsif User.exists?(:email => @user.email)
            flash[:error] = "This email is already in use.  Please provide a different email"
         end
         render 'new'
       end
    end

    def show
        @user = User.find_by(id: params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:name, :age, :password, :bio, :email, :username)
    end
end
