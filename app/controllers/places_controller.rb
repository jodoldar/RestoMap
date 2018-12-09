class PlacesController < ApplicationController
    def new
        @place = Place.new
    end

    def create
        @place = Place.new(place_params)

        if @place.save
            redirect_to @place
        else
            render 'new'
        end
    end

    def show
        @place = Place.find(params[:id])
    end

    def index
        @places = Place.all
    end

    private
        def place_params
            params.require(:place).permit(:title, :text)
        end
end
