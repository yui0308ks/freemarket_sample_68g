class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :zip_code, null: false
      t.integer :prefecture, null: false, default: 0
      t.string :city, null:false
      t.integer :block, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end