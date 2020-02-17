class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :zip_code, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null:false
      t.integer :block, null: false
      t.string :send_name, null: false
      t.string :send_first_name, null: false
      t.string :send_first_name, null: false
      t.string :send_family_name_kana, null: false
      t.string :send_first_name_kana, null: false
      t.integer :phonenumber
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end