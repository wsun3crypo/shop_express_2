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

  # Indirect associations

end
