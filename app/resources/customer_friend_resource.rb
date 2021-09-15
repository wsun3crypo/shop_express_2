class CustomerFriendResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :sender_id, :integer
  attribute :receiver_id, :integer

  # Direct associations

  belongs_to :receiver,
             resource: CustomerResource

  belongs_to :sender,
             resource: CustomerResource

  # Indirect associations

end
