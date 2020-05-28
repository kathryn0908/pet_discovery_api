class AuthenticationController < ApplicationController
    def login
        @user = User.find_by(username: params[:username])

        if !@user
            render json: { error: "Bad Username" }, status: :unauthorized
        else 
            if !@user.authenticate params[:password]
                render json: { error: "Bad Password" }, status: :unauthorized
            else
                render json: { message: "Good Password" }, status: :ok
            end
        end
    end
end


