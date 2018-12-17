class PlacesController < ApplicationController
  def new
    @place = Place.new
    @averages = average(Place.all)
  end

  def create
    @place = Place.new(place_params)
    @averages = average(Place.all)

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
    @averages = average(@places)
    @positions = all_positions(@places)
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])

    if @place.update(place_params)
      redirect_to @place
    else
      render 'edit'
    end
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy

    redirect_to places_path
  end

private

  def place_params
    params.require(:place).permit(:title, :text, :latitude, :longitude)
  end

  def average(places)
    lat_avg = 0
    lon_avg = 0
    places.each do |place|
      lat_avg += place.latitude
      lon_avg += place.longitude
    end
    lat_avg = lat_avg / places.length
    lon_avg = lon_avg / places.length

    return [lat_avg,lon_avg]
  end

  def all_positions(places)
    positions = []
    places.each do |place|
      positions << [place.latitude, place.longitude]
    end
    return positions
  end
end
