class Console::HomeController < Console::ConsoleController
  before_filter { |c| c.authorize 'seller' }

  def index
    @orders_count = Order.all.count
    @products_count = Product.all.count
    @users_count = User.all.count
  end
end
