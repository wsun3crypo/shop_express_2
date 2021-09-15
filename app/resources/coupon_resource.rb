class CouponResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :merchants_id, :integer
  attribute :amount, :integer
  attribute :expiry_date, :date

  # Direct associations

  has_many   :assigned_coupons,
             foreign_key: :coupons_id

  has_many   :purchased_products,
             foreign_key: :coupons_id

  belongs_to :merchants,
             resource: MerchantResource

  # Indirect associations
end
