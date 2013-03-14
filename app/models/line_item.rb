class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product
  belongs_to :order

  attr_accessible :product_id, :cart_id, :quantity, :price

  def total_price
    price * quantity
  end
end

# == Schema Information
#
# Table name: line_items
#
#  id         :integer          not null, primary key
#  product_id :integer
#  cart_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  quantity   :integer          default(1)
#  price      :decimal(8, 2)
#  order_id   :integer
#

