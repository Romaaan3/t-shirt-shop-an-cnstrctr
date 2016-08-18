class RenameColumnTypeToShirtTypeInOrders < ActiveRecord::Migration[5.0]
  def change
    rename_column :orders, :type, :shirt_type

  end
end
