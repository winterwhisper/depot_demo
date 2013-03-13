class StoreController < ApplicationController
  before_filter :count_access_times, :only => :index
  skip_before_filter :authorize

  def index
    @products = Product.order(:title)
    @cart = current_cart
  end
end
