class StoreController < ApplicationController
  # before_filter :count_access_times, :only => :index
  # skip_before_filter :authorize
  # cache_sweeper :product_sweeper

  def index
    unless fragment_exist?("store_list-page#{params[:page]}")
      @products = Product.paginate(:page => params[:page], :per_page => 10, :order => 'title asc')
    end
    @cart = current_cart
  end
end
