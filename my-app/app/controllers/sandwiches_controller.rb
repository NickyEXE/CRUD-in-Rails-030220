class SandwichesController < ApplicationController
    before_action :find_sandwich, except: [:index, :new, :create]

    def index
        @sandwiches = Sandwich.all
    end

    def show
        @sandwich = Sandwich.find(params[:id])
    end

    def new
        @sandwich = Sandwich.new
    end

    def create
        Sandwich.create(sandwich_params)
        redirect_to sandwiches_path
    end

    def edit
    end

    def update
        @sandwich.update(sandwich_params)
        redirect_to @sandwich
    end

    def destroy
        @sandwich.destroy
        redirect_to sandwiches_path
    end

    private

    def find_sandwich
        @sandwich = Sandwich.find(params[:id])
    end

    def sandwich_params
        params.require(:sandwich).permit(:name, :spicyness, :vegetarian)
    end

end
