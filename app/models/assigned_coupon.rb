class AssignedCoupon < ApplicationRecord
  # Direct associations

  belongs_to :customers,
             class_name: "Customer"

  belongs_to :coupons,
             class_name: "Coupon"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    coupons.to_s
  end
end
