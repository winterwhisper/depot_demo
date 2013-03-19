class ProductSweeper < ActionController::Caching::Sweeper
  observe Product

  def after_save(product)
    expire_cache_for(product)
  end

  def after_destroy(product)
    expire_cache_for(product)
  end

  private
  
  def expire_cache_for(product)
    expire_fragment(:products_count)
    expire_fragment(:all_products)
    expire_fragment("product-#{product.id}")
    expire_fragment(:store_list)
  end
end