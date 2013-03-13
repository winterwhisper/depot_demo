class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product
  
  attr_accessible :cart_id, :product_id, :product, :quantity, :price

  def total_price
    price * quantity
  end
end
