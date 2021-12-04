class AddStripeRefundIdToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :stripe_refund_id, :string
  end
end
