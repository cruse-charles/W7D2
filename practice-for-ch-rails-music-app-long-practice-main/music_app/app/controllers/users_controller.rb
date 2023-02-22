class UsersController < ApplicationController


    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            login(@user)
            flash[:messages] = ["Successfully Created"]
            redirect_to users_url(@user.id)
        else
            flash[:error] = ["Failed To Create"]
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
        render :show
    end


    private

    def user_params
        params.require(:user).permit(:email, :password, :session_token)
    end

end
