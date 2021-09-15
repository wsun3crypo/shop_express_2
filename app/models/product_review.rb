class ProductReview < ApplicationRecord
  # Direct associations

  has_many   :purchased_products,
             :foreign_key => "productsreview_id",
             :dependent => :destroy

  belongs_to :customers,
             :class_name => "Customer"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    review
  end

end
