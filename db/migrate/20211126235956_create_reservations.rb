class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :listing, null: false, foreign_key: true
      t.references :guest, null: false, foreign_key: { to_table: :users }
      t.string :session_id
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
