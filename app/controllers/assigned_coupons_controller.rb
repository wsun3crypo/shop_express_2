class AssignedCouponsController < ApplicationController
  before_action :set_assigned_coupon, only: %i[show edit update destroy]

  def index
    @q = AssignedCoupon.ransack(params[:q])
    @assigned_coupons = @q.result(distinct: true).includes(:coupons,
                                                           :customers).page(params[:page]).per(10)
  end

  def show; end

  def new
    @assigned_coupon = AssignedCoupon.new
  end

  def edit; end

  def create
    @assigned_coupon = AssignedCoupon.new(assigned_coupon_params)

    if @assigned_coupon.save
      message = "AssignedCoupon was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @assigned_coupon, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @assigned_coupon.update(assigned_coupon_params)
      redirect_to @assigned_coupon,
                  notice: "Assigned coupon was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @assigned_coupon.destroy
    message = "AssignedCoupon was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to assigned_coupons_url, notice: message
    end
  end

  private

  def set_assigned_coupon
    @assigned_coupon = AssignedCoupon.find(params[:id])
  end

  def assigned_coupon_params
    params.require(:assigned_coupon).permit(:coupons_id, :customers_id)
  end
end
