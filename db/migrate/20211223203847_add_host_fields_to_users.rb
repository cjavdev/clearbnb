class AddHostFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_host, :boolean, default: false
    add_column :users, :stripe_account_id, :string
    add_column :users, :charges_enabled, :boolean, default: false
  end
end
