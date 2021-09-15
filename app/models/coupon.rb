class Coupon < ApplicationRecord
  # Direct associations

  has_many   :assigned_coupons,
             foreign_key: "coupons_id",
             dependent: :destroy

  has_many   :purchased_products,
             foreign_key: "coupons_id"

  belongs_to :merchants,
             class_name: "Merchant"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    merchants.to_s
  end
end
