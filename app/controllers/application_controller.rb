class ApplicationController < ActionController::API
   def authenticate
        authorization_header = request.headers["Authorization"]

        if authorization_header
            begin
                token = authorization_header.split(" ")[1]
                secret = Rails.application.secrets.secret_key_base
                @user_id = JWT.decode(token, secret)[0]["user_id"]
            rescue
                render json: {message: "nope"}, status: :unauthorized
            end
        else
            render json: {message: "nope"}, status: :unauthorized
        end
    end
end
