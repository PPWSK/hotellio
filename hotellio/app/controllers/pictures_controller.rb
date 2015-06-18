class PicturesController < ApplicationController

  before_action :find_accommodation, only: [:create, :new, :destroy]

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = @accommodation.pictures.build(picture_params)
    if @picture.save
      redirect_to edit_user_accommodation_path(
        params[:user_id],
        params[:accommodation_id])
    else
      render :new
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    if @picture.destroy
      redirect_to edit_user_accommodation_path(
        params[:user_id],
        params[:accommodation_id])
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:file)
  end

  def find_accommodation
     @accommodation = Accommodation.find(params[:accommodation_id])
  end

end
