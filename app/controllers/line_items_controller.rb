class LineItemsController < ApplicationController
  # after_filter :reset_access_counter
  before_filter(except: [ :create, :destroy ]) { |c| c.authorize 'seller' }

  # def index
  #   @line_items = LineItem.all

  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @line_items }
  #   end
  # end

  # def show
  #   begin
  #     @line_item = LineItem.find(params[:id])
  #   rescue ActiveRecord::RecordNotFound
  #     logger.error "Attempt to access invalid line item #{params[:id]}"
  #     redirect_to store_url, notice: 'Invalid line item'
  #   else
  #     @cart = current_cart
  #     respond_to do |format|
  #       format.html # show.html.erb
  #       format.json { render json: @line_item }
  #     end
  #   end
  # end

  def new
    @line_item = LineItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @line_item }
    end
  end

  # def edit
  #   @line_item = LineItem.find(params[:id])
  # end

  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to store_url, notice: "Add to cart Success!" }
        # format.js { @current_item = @line_item }
        format.json { render json: @line_item, status: :created, location: @line_item }
      else
        format.html { render action: "new" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # def update
  #   @line_item = LineItem.find(params[:id])

  #   respond_to do |format|
  #     if @line_item.update_attributes(params[:line_item])
  #       format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @line_item.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    @cart = current_cart

    respond_to do |format|
      format.html { redirect_to new_order_url, notice: 'Line item was successfully deleted.' }
      # format.js
      format.json { head :no_content }
    end
  end
end
