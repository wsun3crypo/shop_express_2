class LoyaltyProgram < ApplicationRecord
  # Direct associations

  has_many   :purchased_products,
             foreign_key: "loyaltyprogram_id",
             dependent: :destroy

  belongs_to :customers,
             class_name: "Customer"

  belongs_to :merchants,
             class_name: "Merchant"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    merchants.to_s
  end
end
