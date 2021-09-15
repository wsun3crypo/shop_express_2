class AssignedCouponResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :coupons_id, :integer
  attribute :customers_id, :integer

  # Direct associations

  belongs_to :customers,
             resource: CustomerResource

  belongs_to :coupons,
             resource: CouponResource

  # Indirect associations
end
