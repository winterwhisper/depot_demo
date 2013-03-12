class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product

  attr_accessible :product_id, :cart_id, :quantity, :price

  def total_price
    price * quantity
  end
end
