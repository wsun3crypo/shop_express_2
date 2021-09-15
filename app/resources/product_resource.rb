class ProductResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :merchants_id, :integer
  attribute :description, :string
  attribute :picture, :string
  attribute :price, :string

  # Direct associations

  # Indirect associations

end
