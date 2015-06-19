class AvailabilitiesController < ApplicationController

  before_action :find_accommodation, only: [ :new, :create, :destroy ]

  def new
    @availability = Availability.new
  end

  def create
    @availability = Availability.create(availability_params)
    @availability.accommodation = @accommodation
    if @availability.save!
      redirect_me
    else
      redirect_me
    end
  end

  def destroy
    @availability = Availability.find(params[:id])
    if @availability.destroy
      redirect_me
    else
      redirect_me
    end
  end

  def find_accommodation
    @accommodation = Accommodation.find(params[:accommodation_id])
  end

  def availability_params
    params.require(:availability).permit(:start_date, :end_date, :accommodation_id, :user_id)
  end

  def redirect_me
     redirect_to edit_user_accommodation_path(
        params[:user_id],
        params[:accommodation_id])
  end

end
