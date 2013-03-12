class FillProductPriceToNullLineItemsPrice < ActiveRecord::Migration
  def up
    LineItem.all.each do |line_item|
      if line_item.price.nil?
        price = line_item.product.price
        line_item.update_attribute(:price, price)
      end
    end
  end

  def down
    LineItem.all.each do |line_item|
      unless line_item.price.nil?
        line_item.update_attribute(:price, nil)
      end
    end
  end
end
