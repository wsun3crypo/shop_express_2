class MerchantPartnershipResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :sender_id, :integer
  attribute :receiver_id, :integer

  # Direct associations

  belongs_to :receiver,
             resource: MerchantResource

  belongs_to :sender,
             resource: MerchantResource

  # Indirect associations
end
