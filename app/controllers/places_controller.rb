class PlacesController < ApplicationController
    def new
    end

    def create
        render plain: params[:place].inspect
    end
end
