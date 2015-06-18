class AccommodationsController < ApplicationController

  skip_before_action :authenticate_account!

  def index
    if params[:search_query]
      @search_query = SearchQuery.new(params[:search_query])
      if @search_query.valid?
        # search is valid, searchenginge?
        @accommodations = Accommodation.search(@search_query)
      else
        # search is invalid, no results
        @accommodations = []
      end
    else
      @search_query = SearchQuery.new.with_some_defaults
      @accommodations = Accommodation.all
    end

    # Let's DYNAMICALLY build the markers for the view.
    @markers = Gmaps4rails.build_markers(@accommodations) do |acco, marker|
      marker.lat acco.latitude
      marker.lng acco.longitude
    end
  end

  def show
    @accommodation = Accommodation.find(params[:id])
    @accommodation_coordinates = { lat: @accommodation.latitude, lng: @accommodation.longitude }

    @markers = Gmaps4rails.build_markers(@accommodation) do |acco, marker|
      marker.lat acco.latitude
      marker.lng acco.longitude
    end
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
    params.require(:accommodation).permit(:title, :location, :description, :price, :type, :guest_number, :start_date, :end_date)
  end

end
