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

  has_many   :received_partnership_request,
             resource: MerchantPartnershipResource,
             foreign_key: :receiver_id

  has_many   :partnership_request,
             resource: MerchantPartnershipResource,
             foreign_key: :sender_id

  has_many   :loyalty_members,
             resource: LoyaltyProgramResource,
             foreign_key: :merchants_id

  has_many   :products,
             foreign_key: :merchants_id

  has_many   :coupons,
             foreign_key: :merchants_id

  # Indirect associations

end
