class PurchasedProductResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :products_id, :integer
  attribute :coupons_id, :integer
  attribute :customers_id, :integer
  attribute :quantity, :string
  attribute :loyaltyprogram_id, :integer
  attribute :productsreview_id, :integer

  # Direct associations

  # Indirect associations

end