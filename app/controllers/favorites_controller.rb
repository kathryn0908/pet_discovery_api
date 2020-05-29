class FavoritesController < ApplicationController
    before_action :authenticate, only: [:create, :index, :show]
    before_action :find_favorite_by_id, only: [:show, :update, :destroy]
    def index
        @favorite = Favorite.all 
        render json: @favorite       
    end

    def show
        render json: @favorite
    end

    def create
        byebug
        @favorite = Favorite.create(favorite_params)
        render json: @favorite
    end

    def update
        @favorite.update(favorite_params)
        render json: @favorite 
            
        
    end

    def destroy
        @favorite.destroy 
    
        redirect_to action: "index"
    end

    private

    def find_favorite_by_id
        @favorite = Favorite.find(params[:id])
    end

    def favorite_params
        # params[:favorite][:user_id] = @user_id
        params.require(:favorite).permit(:dog_id).merge(user_id: @user_id)   
    end
end

