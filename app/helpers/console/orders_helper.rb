module Console::OrdersHelper
  def convert_payment_type_to_string(pay_type)
    Settings.payment_types.key(pay_type)
  end
end
