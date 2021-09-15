class Coupon < ApplicationRecord
  # Direct associations

  belongs_to :merchants,
             :class_name => "Merchant"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    merchants.to_s
  end

end
