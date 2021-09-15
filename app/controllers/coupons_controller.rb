class CouponsController < ApplicationController
  before_action :current_merchant_must_be_coupon_merchants,
                only: %i[edit update destroy]

  before_action :set_coupon, only: %i[show edit update destroy]

  def index
    @q = Coupon.ransack(params[:q])
    @coupons = @q.result(distinct: true).includes(:merchants,
                                                  :purchased_products, :assigned_coupons).page(params[:page]).per(10)
  end

  def show
    @assigned_coupon = AssignedCoupon.new
    @purchased_product = PurchasedProduct.new
  end

  def new
    @coupon = Coupon.new
  end

  def edit; end

  def create
    @coupon = Coupon.new(coupon_params)

    if @coupon.save
      message = "Coupon was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @coupon, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @coupon.update(coupon_params)
      redirect_to @coupon, notice: "Coupon was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @coupon.destroy
    message = "Coupon was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to coupons_url, notice: message
    end
  end

  private

  def current_merchant_must_be_coupon_merchants
    set_coupon
    unless current_merchant == @coupon.merchants
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_coupon
    @coupon = Coupon.find(params[:id])
  end

  def coupon_params
    params.require(:coupon).permit(:merchants_id, :amount, :expiry_date)
  end
end
