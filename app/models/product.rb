class Product < ApplicationRecord
  # Direct associations

  has_many   :purchased_products,
             :foreign_key => "products_id"

  belongs_to :merchants,
             :class_name => "Merchant"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    merchants.to_s
  end

end
