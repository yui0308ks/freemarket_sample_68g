class RemoveAuthenticationNumFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :authentication_num, :integer
  end
end
