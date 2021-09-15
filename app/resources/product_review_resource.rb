class ProductReviewResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :review, :string
  attribute :customers_id, :integer

  # Direct associations

  has_many   :purchased_products,
             foreign_key: :productsreview_id

  belongs_to :customers,
             resource: CustomerResource

  # Indirect associations
end
