class AvailabilityController < ApplicationController

  before_action :find_accommodation, only: [ :new, :create, :destroy ]

  def new
    @availability = Availability.new
  end

  def create
    @availability = Availability.create(availability_params)
    @availability.save
  end

  def destroy
    @availability = Availability.find(params[:id])
    @availability.destroy
  end

  def find_accommodation
    @accommodation = Accommodation.find(params[:accommodation_id])
  end

end
