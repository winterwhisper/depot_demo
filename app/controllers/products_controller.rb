class ProductsController < ApplicationController
  # before_filter { |c| c.authorize 'seller' }

  # def index
  #   @products = Product.paginate(:page => params[:page], :per_page => 10)

  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @products }
  #   end
  # end

  def show
    begin
      unless fragment_exist? "product-#{params[:id]}"
        @product = Product.find(params[:id])
      end
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid product #{params[:id]}"
      redirect_to store_url, notice: 'Invalid product'
    else
      respond_to do |format|
        @cart = current_cart
        format.html # show.html.erb
        format.json { render json: @product }
      end
    end
  end

  # def new
  #   @product = Product.new

  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render json: @product }
  #   end
  # end

  # def edit
  #   @product = Product.find(params[:id])
  #   @cart = current_cart
  # end

  # def create
  #   @product = Product.new(params[:product])

  #   respond_to do |format|
  #     if @product.save
  #       format.html { redirect_to @product, notice: 'Product was successfully created.' }
  #       format.json { render json: @product, status: :created, location: @product }
  #     else
  #       format.html { render action: "new" }
  #       format.json { render json: @product.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def update
  #   @product = Product.find(params[:id])

  #   respond_to do |format|
  #     if @product.update_attributes(params[:product])
  #       format.html { redirect_to @product, notice: 'Product was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @product.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def destroy
  #   @product = Product.find(params[:id])
  #   @product.destroy

  #   respond_to do |format|
  #     format.html { redirect_to products_url }
  #     format.json { head :no_content }
  #   end
  # end

  def who_bought
    @product = Product.where("id = ?", params[:id])
    respond_to do |format|
      format.atom
    end
  end
end
