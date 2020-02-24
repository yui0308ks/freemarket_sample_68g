class ChangeColumnToImage < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :images, :items
    remove_index :images, :items_id
    remove_reference :images, :items
  end
end
