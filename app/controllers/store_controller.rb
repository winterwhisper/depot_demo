class StoreController < ApplicationController
  before_filter :count_access_times, :only => :index

  def index
    @products = Product.order(:title)
    @cart = current_cart
  end
end
