module OrdersHelper
  def payment_types
    Order.payment_types
  end
end
