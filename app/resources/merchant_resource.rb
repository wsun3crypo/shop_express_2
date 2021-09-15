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

  has_many :purchased_products do
    assign_each do |merchant, purchased_products|
      purchased_products.select do |p|
        p.id.in?(merchant.purchased_products.map(&:id))
      end
    end
  end

  has_many :customers_dealings, resource: CustomerResource do
    assign_each do |merchant, customers|
      customers.select do |c|
        c.id.in?(merchant.customers_dealings.map(&:id))
      end
    end
  end


  filter :customers_id, :integer do
    eq do |scope, value|
      scope.eager_load(:customers_dealings).where(:purchased_products => {:customers_id => value})
    end
  end
end
