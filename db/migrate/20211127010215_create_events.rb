class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.text :request_body
      t.integer :status, default: 0
      t.text :error_message
      t.string :source
      t.string :event_type

      t.timestamps
    end
  end
end
