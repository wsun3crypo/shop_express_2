class PurchasedProductsController < ApplicationController
  before_action :set_purchased_product, only: [:show, :edit, :update, :destroy]

  # GET /purchased_products
  def index
    @purchased_products = PurchasedProduct.all
  end

  # GET /purchased_products/1
  def show
  end

  # GET /purchased_products/new
  def new
    @purchased_product = PurchasedProduct.new
  end

  # GET /purchased_products/1/edit
  def edit
  end

  # POST /purchased_products
  def create
    @purchased_product = PurchasedProduct.new(purchased_product_params)

    if @purchased_product.save
      message = 'PurchasedProduct was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @purchased_product, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /purchased_products/1
  def update
    if @purchased_product.update(purchased_product_params)
      redirect_to @purchased_product, notice: 'Purchased product was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /purchased_products/1
  def destroy
    @purchased_product.destroy
    message = "PurchasedProduct was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to purchased_products_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchased_product
      @purchased_product = PurchasedProduct.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def purchased_product_params
      params.require(:purchased_product).permit(:products_id, :coupons_id, :customers_id, :quantity, :loyaltyprogram_id, :productsreview_id)
    end
end
