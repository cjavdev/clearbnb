class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.references :host, null: false, foreign_key: { to_table: :users }
      t.string :title, null: false
      t.text :about
      t.integer :max_guests, default: 1
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :lng, precision: 10, scale: 6
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
