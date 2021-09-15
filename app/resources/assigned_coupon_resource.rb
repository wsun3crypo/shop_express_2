class AssignedCouponResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :coupons_id, :integer
  attribute :customers_id, :integer

  # Direct associations

  # Indirect associations

end
