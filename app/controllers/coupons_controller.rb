class CouponsController < ApplicationController
  before_action :current_merchant_must_be_coupon_merchants, only: [:edit, :update, :destroy] 

  before_action :set_coupon, only: [:show, :edit, :update, :destroy]

  # GET /coupons
  def index
    @q = Coupon.ransack(params[:q])
    @coupons = @q.result(:distinct => true).includes(:merchants, :purchased_products, :assigned_coupons).page(params[:page]).per(10)
  end

  # GET /coupons/1
  def show
    @assigned_coupon = AssignedCoupon.new
    @purchased_product = PurchasedProduct.new
  end

  # GET /coupons/new
  def new
    @coupon = Coupon.new
  end

  # GET /coupons/1/edit
  def edit
  end

  # POST /coupons
  def create
    @coupon = Coupon.new(coupon_params)

    if @coupon.save
      message = 'Coupon was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @coupon, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /coupons/1
  def update
    if @coupon.update(coupon_params)
      redirect_to @coupon, notice: 'Coupon was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /coupons/1
  def destroy
    @coupon.destroy
    message = "Coupon was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to coupons_url, notice: message
    end
  end


  private

  def current_merchant_must_be_coupon_merchants
    set_coupon
    unless current_merchant == @coupon.merchants
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_coupon
      @coupon = Coupon.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def coupon_params
      params.require(:coupon).permit(:merchants_id, :amount, :expiry_date)
    end
end
