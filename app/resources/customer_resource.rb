class CustomerResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string

  # Direct associations

  has_many   :product_reviews,
             foreign_key: :customers_id

  has_many   :assigned_coupons,
             foreign_key: :customers_id

  has_many   :received_many_friends_request,
             resource: CustomerFriendResource,
             foreign_key: :receiver_id

  has_many   :sent_many_friends_request,
             resource: CustomerFriendResource,
             foreign_key: :sender_id

  has_many   :loyalty_programs,
             foreign_key: :customers_id

  has_many   :purchased_products,
             foreign_key: :customers_id

  # Indirect associations

  has_many :merchants_dealings, resource: MerchantResource do
    assign_each do |customer, merchants|
      merchants.select do |m|
        m.id.in?(customer.merchants_dealings.map(&:id))
      end
    end
  end


  filter :products_id, :integer do
    eq do |scope, value|
      scope.eager_load(:merchants_dealings).where(:purchased_products => {:products_id => value})
    end
  end
end
