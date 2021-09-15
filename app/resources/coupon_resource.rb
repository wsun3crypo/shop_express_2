class CouponResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :merchants_id, :integer
  attribute :amount, :integer
  attribute :expiry_date, :date

  # Direct associations

  # Indirect associations

end
