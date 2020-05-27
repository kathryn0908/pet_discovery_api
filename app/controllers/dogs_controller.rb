class DogsController < ApplicationController
    before_action :find_dog_by_id, only: [:show, :update, :destroy]
    def index
        @dogs = Dog.all 
        render json: @dogs
    end

    def show
        render json: @dog
    end

    def create
        @dog = Dog.create(dog_params)
        render json: @dog
    end

    def update
        @dog.update(dog_params)
        render json: @dog 
            
        
    end

    def destroy
        @dog.destroy 
    
        redirect_to action: "index"
    end

    private

    def find_dog_by_id
        @dog = Dog.find(params[:id])
    end

    def dog_params
        params.require(:dog).permit([:image, :life_span, :name, :temperament, :weight])    
    end
end
