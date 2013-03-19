class Console::HomeController < Console::ConsoleController
  before_filter { |c| c.authorize 'seller' }
  cache_sweeper :order_sweeper
  cache_sweeper :product_sweeper
  cache_sweeper :user_sweeper

  def index
    unless fragment_exist? :orders_count
      @orders_count = Order.all.count
    end
    unless fragment_exist? :products_count
      @products_count = Product.all.count
    end
    unless fragment_exist? :users_count
      @users_count = User.all.count
    end
  end
end
