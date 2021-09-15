class PurchasedProduct < ApplicationRecord
  # Direct associations

  belongs_to :loyaltyprogram,
             :class_name => "LoyaltyProgram"

  belongs_to :customers,
             :class_name => "Customer"

  belongs_to :products,
             :class_name => "Product",
             :counter_cache => true

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
