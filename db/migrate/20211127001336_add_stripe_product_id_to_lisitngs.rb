class AddStripeProductIdToLisitngs < ActiveRecord::Migration[7.0]
  def change
    add_column :listings, :stripe_product_id, :string
  end
end
