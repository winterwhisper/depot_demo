class Console::OrdersController < Console::ConsoleController
  before_filter { |c| c.authorize 'seller' }
  cache_sweeper :order_sweeper, :only => [ :create, :update, :destroy ]
  cache_sweeper :product_sweeper, :only => [ :create, :update, :destroy ]
  
  def index
    unless fragment_exist?("all_orders-page#{params[:page]}")
      @orders = Order.paginate(:page => params[:page], :per_page => 20)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  def show
    unless fragment_exist? "order-#{params[:id]}"
      @order = Order.find(params[:id])
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # def new
  #   @order = Order.new

  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render json: @order }
  #   end
  # end

  def edit
    @order = Order.find(params[:id])
  end

  # def create
  #   @order = Order.new(params[:order])

  #   respond_to do |format|
  #     if @order.save
  #       format.html { redirect_to @order, notice: 'Order was successfully created.' }
  #       format.json { render json: @order, status: :created, location: @order }
  #     else
  #       format.html { render action: "new" }
  #       format.json { render json: @order.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order = Order.find(params[:id])
    line_items = []
    @order.line_items.each do |item|
      line_items << item
    end
    if @order.destroy
      line_items.each do |item|
        item.product.update_attribute(:stock, item.product.stock + item.quantity)
      end
    end

    respond_to do |format|
      format.html { redirect_to console_orders_url }
      format.json { head :no_content }
    end
  end
end
