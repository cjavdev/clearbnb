class Host::PhotosController < ApplicationController
  before_action :authenticate_user!

  def index
    @listing = current_user.listings.find(params[:listing_id])
    @photos = @listing.photos
  end

  def create
    @listing = current_user.listings.find(params[:listing_id])
    @photo = @listing.photos.new(photo_params)
    if !@photo.save
      flash[:errors] = @photo.errors.full_messages
    end
    redirect_to host_listing_photos_path(@listing)
  end

  private

  def photo_params
    params.require(:photo).permit(:caption, :photo)
  end
end
