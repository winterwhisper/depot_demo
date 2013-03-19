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
    pages = Product.all.count / 10 + 1
    expire_fragment("all_products-page")
    expire_fragment("store_list-page")
    for page in 1..pages
      expire_fragment("all_products-page#{page}")
      expire_fragment("store_list-page#{page}")
    end
    expire_fragment("product-#{product.id}")
    expire_fragment("console-product-#{params[:id]}")
  end
end