class PurchasedProductResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :products_id, :integer
  attribute :coupons_id, :integer
  attribute :customers_id, :integer
  attribute :quantity, :string
  attribute :loyaltyprogram_id, :integer
  attribute :productsreview_id, :integer

  # Direct associations

  belongs_to :productsreview,
             resource: ProductReviewResource

  belongs_to :loyaltyprogram,
             resource: LoyaltyProgramResource

  belongs_to :customers,
             resource: CustomerResource

  belongs_to :products,
             resource: ProductResource

  belongs_to :coupons,
             resource: CouponResource

  # Indirect associations

  has_one    :merchant

  filter :merchants_id, :integer do
    eq do |scope, value|
      scope.eager_load(:merchant).where(:products => {:merchants_id => value})
    end
  end
end
