class LoyaltyProgramResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :merchants_id, :integer
  attribute :customers_id, :integer

  # Direct associations

  has_many   :purchased_products,
             foreign_key: :loyaltyprogram_id

  belongs_to :customers,
             resource: CustomerResource

  belongs_to :merchants,
             resource: MerchantResource

  # Indirect associations
end
