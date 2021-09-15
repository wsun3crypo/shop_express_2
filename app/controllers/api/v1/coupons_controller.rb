class Api::V1::CouponsController < Api::V1::GraphitiController
  def index
    coupons = CouponResource.all(params)
    respond_with(coupons)
  end

  def show
    coupon = CouponResource.find(params)
    respond_with(coupon)
  end

  def create
    coupon = CouponResource.build(params)

    if coupon.save
      render jsonapi: coupon, status: :created
    else
      render jsonapi_errors: coupon
    end
  end

  def update
    coupon = CouponResource.find(params)

    if coupon.update_attributes
      render jsonapi: coupon
    else
      render jsonapi_errors: coupon
    end
  end

  def destroy
    coupon = CouponResource.find(params)

    if coupon.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: coupon
    end
  end
end
