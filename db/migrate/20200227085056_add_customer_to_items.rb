class AddCustomerToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :customer, foreign_key: { to_table: :users }
  end
end