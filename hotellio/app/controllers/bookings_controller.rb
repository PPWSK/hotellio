class BookingsController < ApplicationController

  before_action :find_user, only: [ :new, :create, :index ]
  before_action :find_accommodation, only: [ :new, :create ]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.create(booking_params)
      @booking.user = @user
      @booking.accommodation = @accommodation
      if @booking.save
        redirect_to user_bookings_path()
      else
        render :new
      end
  end

  def destroy
  end

  def show
  end

  def index
    @bookings = Booking.where(user_id: @user)
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :price, :number_of_guests, :user_id, :accommodation_id)
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_accommodation
    @accommodation = Accommodation.find(params[:accommodation_id])
  end

end
