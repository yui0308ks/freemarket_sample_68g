class ChangeColumnToItem < ActiveRecord::Migration[5.2]
  def up
    change_column :items, :delivery_charge_id, :integer
    change_column :items, :delivery_way_id, :integer
    change_column :items, :delivery_day_id, :integer
    change_column :items, :prefecture_id, :integer
  end

  # 変更前の状態
  def down
    change_column :items, :delivery_charge_id, :references
    change_column :items, :delivery_way_id, :references
    change_column :items, :delivery_day_id, :references
    change_column :items, :prefecture_id, :references
  end
end
