class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.references :from_user, null: false, foreign_key: { to_table: :users }
      t.references :to_user, null: false, foreign_key: { to_table: :users }
      t.references :reservation, null: true, foreign_key: true
      t.string :content, null: false, default: ''

      t.timestamps
    end
  end
end
