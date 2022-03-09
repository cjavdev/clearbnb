class CreateCalendarEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :calendar_events do |t|
      t.references :listing, null: false, foreign_key: true
      t.references :reservation, null: true, foreign_key: true
      t.integer :status, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false

      t.timestamps
    end
  end
end
