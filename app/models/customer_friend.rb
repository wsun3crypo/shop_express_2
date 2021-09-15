class CustomerFriend < ApplicationRecord
  # Direct associations

  belongs_to :receiver,
             :class_name => "Customer"

  belongs_to :sender,
             :class_name => "Customer"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    sender.to_s
  end

end
