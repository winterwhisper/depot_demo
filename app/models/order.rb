class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  attr_accessible :address, :email, :name, :pay_type

  # PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]

  validates :name, :address, :email, presence: true
  validates :pay_type, :inclusion =>{ :in => Proc.new { Settings.payment_types.values } }

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.product.update_attribute(:stock, item.product.stock - item.quantity)
      item.cart_id = nil
      line_items << item
    end
  end

  def self.payment_types
    Settings.payment_types.map { |k, v| [k, v] }
  end

end

# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  address    :text
#  email      :string(255)
#  pay_type   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

