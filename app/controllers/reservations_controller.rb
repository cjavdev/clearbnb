class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def cancel
    @reservation = current_user.reservations.find(params[:id])
    # make api call to refund payment
    refund = Stripe::Refund.create({
      payment_intent: @reservation.stripe_payment_intent_id,
    })
    @reservation.update(status: :canceling, stripe_refund_id: refund.id)
    redirect_to reservation_path(@reservation)
  end

  def new
    @listing = Listing.find(params[:listing_id])
    @calendar_events = @listing.calendar_events
  end

  def create
    @booking = BookListing.new(current_user, reservation_params)

    if @booking.save
      redirect_to @booking.checkout_url, allow_other_hosts: true, status: :see_other
    else
      flash.now[:errors] = @booking.errors
      @listing = @booking.listing
      @calendar_events = @listing.calendar_events
      render :new
    end
  end

  def show
    @reservation = current_user.reservations.find(params[:id])
  end

  private

  def reservation_params
    params.require(:reservation).permit(:listing_id, :start_date, :end_date)
  end
end
