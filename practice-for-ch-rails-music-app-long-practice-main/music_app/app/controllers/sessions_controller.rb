class SessionsController < ApplicationController
    before_action :require_logged_in, only: [:destroy]
    before_action :require_logged_out, only [:create, :new]

    def new
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:email],params[:user][:password])
            
        if @user
            login(@user)
            redirect_to (@user.id)
        else
            render :new
        end
    
    end
end
