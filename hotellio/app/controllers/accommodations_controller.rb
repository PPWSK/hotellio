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
  end

  def show
    @accommodation = Accommodation.find(params[:id])
    @accommodation_coordinates = { lat: @accommodation.latitude, lng: @accommodation.longitude }
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
    params.require(:accommodation).permit(:title, :description, :price, :type, :guest_number)
  end

end
