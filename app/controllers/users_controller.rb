class UsersController < ApplicationController
    before_action :authenticate, only: [:index, :show]

    def index
        @users = User.all 
        render json: @users
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def create
       @user = User.create(user_params)
       render json: @user
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params) 
            render json: @user 
          else 
            render json: @user.errors.messages 
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy 
    
        redirect_to action: "index"
    end

    private

    def user_params
        params.require(:user).permit([:username, :password])
    end
end
