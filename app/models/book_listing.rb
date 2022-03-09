class BookListing
  include Rails.application.routes.url_helpers

  attr_reader :current_user, :params

  def initialize(current_user, params)
    @current_user = current_user
    @params = params
  end

  def save
    if valid?
      calendar_event.save && reservation.save
    end
  end

  def valid?
    calendar_event.valid? || reservation.valid?
  end

  def errors
    calendar_event.errors.full_messages + reservation.errors.full_messages
  end

  def checkout_url
    checkout_session.url
  end

  def checkout_session
    return @checkout_session if @checkout_session

    # Create a Stripe Checkout session
    @checkout_session = Stripe::Checkout::Session.create(
      success_url: reservation_url(reservation),
      cancel_url: expire_reservation_url(reservation) + "?session_id={CHECKOUT_SESSION_ID}",
      customer: current_user.stripe_customer_id,
      mode: 'payment',
      allow_promotion_codes: true,
      expires_at: 1.hour.from_now.to_i,
      submit_type: 'book',
      line_items: [{
        price_data: {
          unit_amount: listing.nightly_price,
          currency: 'usd',
          product: listing.stripe_product_id,
        },
        quantity: reservation.nights, # Num nights
      }, {
        price_data: {
          unit_amount: listing.cleaning_fee,
          currency: 'usd',
          product: 'prod_KfZvqsikciZVFr', # Cleaning fee product ID
        },
        quantity: 1
      }],
      metadata: {
        listing_id: listing.id,
        reservation_id: reservation.id,
        guest_id: current_user.id,
        start_date: start_date,
        end_date: end_date,
      },
      payment_intent_data: {
        application_fee_amount: ((listing.cleaning_fee + listing.nightly_price) * 0.10).to_i,
        transfer_data: {
          destination: listing.host.stripe_account_id
        },
        metadata: {
          reservation_id: reservation.id,
          listing_id: listing.id,
          reservation_id: reservation.id,
          guest_id: current_user.id,
          start_date: start_date,
          end_date: end_date,
        }
      }
    )
    reservation.update(session_id: @checkout_session.id)
    checkout_session
  end

  def calendar_event
    @calendar_event ||= CalendarEvent.new(
      listing: listing,
      reservation: reservation,
      status: :reserved,
      start_date: start_date,
      end_date: end_date,
    )
  end

  def reservation
    @reservation ||= Reservation.new(
      listing: listing,
      guest: current_user,
    )
  end

  def listing
    @listing ||= Listing.find(listing_id)
  end

  private

  def start_date
    params[:start_date]
  end

  def end_date
    params[:end_date]
  end

  def listing_id
    params[:listing_id]
  end
end
