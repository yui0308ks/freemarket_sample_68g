class RemovePhoneNumFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :phone_num, :string
  end
end
