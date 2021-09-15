class PurchasedProductsController < ApplicationController
  before_action :set_purchased_product, only: %i[show edit update destroy]

  def index
    @q = PurchasedProduct.ransack(params[:q])
    @purchased_products = @q.result(distinct: true).includes(:coupons,
                                                             :products, :customers, :loyaltyprogram, :productsreview, :merchant).page(params[:page]).per(10)
  end

  def show; end

  def new
    @purchased_product = PurchasedProduct.new
  end

  def edit; end

  def create
    @purchased_product = PurchasedProduct.new(purchased_product_params)

    if @purchased_product.save
      message = "PurchasedProduct was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @purchased_product, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @purchased_product.update(purchased_product_params)
      redirect_to @purchased_product,
                  notice: "Purchased product was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @purchased_product.destroy
    message = "PurchasedProduct was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to purchased_products_url, notice: message
    end
  end

  private

  def set_purchased_product
    @purchased_product = PurchasedProduct.find(params[:id])
  end

  def purchased_product_params
    params.require(:purchased_product).permit(:products_id, :coupons_id,
                                              :customers_id, :quantity, :loyaltyprogram_id, :productsreview_id)
  end
end
