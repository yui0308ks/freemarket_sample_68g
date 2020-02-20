class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :zip_code, null: false
      t.integer :prefecture, null: false, default: 0
      t.string :city, null:false
      t.integer :block, null: false
      t.references :user, null: false, foreign_key: true
      t.string :first_name,          null: false
      t.string :last_name,           null: false
      t.string :first_name_kana,     null: false
      t.string :last_name_kana,      null: false
      t.timestamps
    end
  end
end