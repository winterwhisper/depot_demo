class OrderSweeper < ActionController::Caching::Sweeper
  observe Order

  def after_save(order)
    expire_cache_for(order)
  end

  def after_destroy(order)
    expire_cache_for(order)
  end

  private
  
  def expire_cache_for(order)
    expire_fragment(:orders_count)
    pages = Order.all.count / 20 + 1
    expire_fragment("all_orders-page")
    for page in 1..pages
      expire_fragment("all_orders-page#{page}")
    end
    expire_fragment("order-#{order.id}")
  end
end