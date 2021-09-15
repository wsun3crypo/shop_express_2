class MerchantResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :name, :string
  attribute :description, :string
  attribute :address, :integer
  attribute :tel, :string
  attribute :picture, :string

  # Direct associations

  has_many   :coupons,
             foreign_key: :merchants_id

  # Indirect associations

end
