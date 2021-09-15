class Api::V1::AssignedCouponsController < Api::V1::GraphitiController
  def index
    assigned_coupons = AssignedCouponResource.all(params)
    respond_with(assigned_coupons)
  end

  def show
    assigned_coupon = AssignedCouponResource.find(params)
    respond_with(assigned_coupon)
  end

  def create
    assigned_coupon = AssignedCouponResource.build(params)

    if assigned_coupon.save
      render jsonapi: assigned_coupon, status: :created
    else
      render jsonapi_errors: assigned_coupon
    end
  end

  def update
    assigned_coupon = AssignedCouponResource.find(params)

    if assigned_coupon.update_attributes
      render jsonapi: assigned_coupon
    else
      render jsonapi_errors: assigned_coupon
    end
  end

  def destroy
    assigned_coupon = AssignedCouponResource.find(params)

    if assigned_coupon.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: assigned_coupon
    end
  end
end
