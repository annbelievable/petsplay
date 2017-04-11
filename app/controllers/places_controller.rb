class PlacesController < ApplicationController
  def index
    @places = Place.order('created_at DESC')
  end

  def show
    @place = Place.find(params[:id])
  end

  def new
    @place = Place.new

  end

  def create
    result = request.location
    @place = Place.new(place_params)
    
    if @place.save
      flash[:success] = "Place added!"
      redirect_to root_path
    else
      render 'new'
    end
  end


# hiddend methods act as helper to permit certain input from forms
  private

  def place_params
    params.require(:place).permit(:title, :address, :visited_by ,:longitude)
  end
end
