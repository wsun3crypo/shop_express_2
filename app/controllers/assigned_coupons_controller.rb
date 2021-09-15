class AssignedCouponsController < ApplicationController
  before_action :set_assigned_coupon, only: [:show, :edit, :update, :destroy]

  # GET /assigned_coupons
  def index
    @q = AssignedCoupon.ransack(params[:q])
    @assigned_coupons = @q.result(:distinct => true).includes(:coupons, :customers).page(params[:page]).per(10)
  end

  # GET /assigned_coupons/1
  def show
  end

  # GET /assigned_coupons/new
  def new
    @assigned_coupon = AssignedCoupon.new
  end

  # GET /assigned_coupons/1/edit
  def edit
  end

  # POST /assigned_coupons
  def create
    @assigned_coupon = AssignedCoupon.new(assigned_coupon_params)

    if @assigned_coupon.save
      message = 'AssignedCoupon was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @assigned_coupon, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /assigned_coupons/1
  def update
    if @assigned_coupon.update(assigned_coupon_params)
      redirect_to @assigned_coupon, notice: 'Assigned coupon was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /assigned_coupons/1
  def destroy
    @assigned_coupon.destroy
    message = "AssignedCoupon was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to assigned_coupons_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assigned_coupon
      @assigned_coupon = AssignedCoupon.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def assigned_coupon_params
      params.require(:assigned_coupon).permit(:coupons_id, :customers_id)
    end
end
