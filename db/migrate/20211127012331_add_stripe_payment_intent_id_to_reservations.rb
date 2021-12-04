class AddStripePaymentIntentIdToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :stripe_payment_intent_id, :string
  end
end
