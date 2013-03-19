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
    expire_fragment(:all_orders)
    expire_fragment("order-#{order.id}")
  end
end