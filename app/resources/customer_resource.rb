class CustomerResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string

  # Direct associations

  has_many   :loyalty_programs,
             foreign_key: :customers_id

  has_many   :purchased_products,
             foreign_key: :customers_id

  # Indirect associations

end
