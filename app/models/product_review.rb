class ProductReview < ApplicationRecord
  # Direct associations

  belongs_to :customers,
             :class_name => "Customer"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    review
  end

end
