class ReviewsController < ApplicationController

  before_action :find_accommodation, only: [:create]

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = @accommodation.reviews.build(review_params)
    if @review.save
      redirect_to accommodation_show_path(@review)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description)
  end

  def find_accommodation
    @accommodation = Accommodation.find(params[:accommodation_id])
  end
end
