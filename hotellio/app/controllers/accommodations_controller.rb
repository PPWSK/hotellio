class AccommodationsController < ApplicationController

  skip_before_action :authenticate_account!

  def index
    if params[:search]
      @search = Search.new(params[:search])
      if @search.valid?
        @accommodations = Accommodation.search(@search)
        #searchengine...
      else
        @accommodations = []
      end
    else
      @accommodations = Accommodation.all
      @search = Search.new
        @markers = Gmaps4rails.build_markers(@flats) do |accommodation, marker|
        marker.lat accommodation.latitude
        marker.lng accommodation.longitude
      end
    end
  end

  def show
    @accommodation = Accommodation.find(params[:id])
    @accommodation_coordinates = { lat: @accommodation.lat, lng: @accommodation.lng }
  end

  def new
    @accommodation = Accommodation.new
  end

  def create
    @accommodation = Accommodation.create(accommodation_params)
      if @accommodation.save
        redirect_to accommodation_path(@accommodation)
      else
        render :new
      end
  end

  private

  def accommodation_params
    params.require(:accommodation).permit(:title, :description, :price, :type, :guest_number, :location, :latitude, :longitude, :start_date, :end_date)
  end

end
