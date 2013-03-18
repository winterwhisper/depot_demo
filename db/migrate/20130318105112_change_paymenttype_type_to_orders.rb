class ChangePaymenttypeTypeToOrders < ActiveRecord::Migration
  def up
    change_column :orders, :pay_type, :integer
  end

  def down
    change_column :orders, :pay_type, :string
  end
end
