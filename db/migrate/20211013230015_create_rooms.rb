class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.references :listing, null: false, foreign_key: true
      t.integer :room_type

      t.timestamps
    end
  end
end
