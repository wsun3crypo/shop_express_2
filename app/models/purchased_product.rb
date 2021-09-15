class PurchasedProduct < ApplicationRecord
  # Direct associations

  belongs_to :coupons,
             :required => false,
             :class_name => "Coupon",
             :counter_cache => true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    products.to_s
  end

end
