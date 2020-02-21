class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.references :category
      # t.enum :condition
      t.integer :size
      t.references :delivery_charge
      t.references :delivery_way
      t.references :delivery_day
      t.references :prefecture
      t.integer :price
      t.timestamps
    end
  end
end
