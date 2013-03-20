class AddStockToProducts < ActiveRecord::Migration
  def change
    add_column :products, :stock, :integer
    execute "ALTER TABLE products ADD CONSTRAINT check_stock_cannot_negative CHECK (stock >= 0 )"
  end

  # def self.down
  #   execute "ALTER TABLE products DROP CONSTRAINT check_stock_cannot_negative"
  #   remove_column :products, :stock
  # end
end
