class ListingsController < ApplicationController
  def index
    @listings = Listing.published
  end

  def show
    @listing = Listing.published.find(params[:id])
  end
end
