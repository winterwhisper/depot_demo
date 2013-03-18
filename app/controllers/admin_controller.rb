class AdminController < ApplicationController
  before_filter { |c| c.authorize 'seller' }

  def index
    @total_orders = Order.count
  end
end
