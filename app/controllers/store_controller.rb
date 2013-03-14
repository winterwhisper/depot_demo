class StoreController < ApplicationController
  before_filter :count_access_times, :only => :index
  skip_before_filter :authorize

  def index
    @products = Product.paginate(:page => params[:page], :per_page => 6, :order => 'title asc')
    @cart = current_cart
  end
end
