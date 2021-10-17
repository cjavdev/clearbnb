class Host::RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @listing = current_user.listings.find(params[:listing_id])
    @rooms = @listing.rooms.all
  end

  def create
    @listing = current_user.listings.find(params[:listing_id])
    @room = @listing.rooms.new(room_params)
    if !@room.save
      flash[:errors] = @room.errors.full_messages
    end

    redirect_to host_listing_rooms_path(@listing)
  end

  def destroy
    @listing = current_user.listings.find(params[:listing_id])
    @room = @listing.rooms.find(params[:id])
    @room.destroy
    redirect_to host_listing_rooms_path(@listing)
  end

  private

  def room_params
    params.require(:room).permit(:room_type, beds_attributes: [:bed_size])
  end
end
