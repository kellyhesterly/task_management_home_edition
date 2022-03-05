class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
       @user = User.create(user_params)
       if @user.valid?
         session[:user_id] = @user.id
         redirect_to user_path(@user), :flash => { :success => "You have registered successfully!" }
       else
         if user_params[:email] == ""
            flash[:error] = "Please provide an email address"
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
