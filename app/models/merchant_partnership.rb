class MerchantPartnership < ApplicationRecord
  # Direct associations

  belongs_to :receiver,
             class_name: "Merchant"

  belongs_to :sender,
             class_name: "Merchant"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    sender.to_s
  end
end
