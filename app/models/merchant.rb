class Merchant < ApplicationRecord
  # Direct associations

  has_many   :received_partnership_request,
             :class_name => "MerchantPartnership",
             :foreign_key => "receiver_id",
             :dependent => :destroy

  has_many   :partnership_request,
             :class_name => "MerchantPartnership",
             :foreign_key => "sender_id",
             :dependent => :destroy

  has_many   :loyalty_members,
             :class_name => "LoyaltyProgram",
             :foreign_key => "merchants_id",
             :dependent => :destroy

  has_many   :products,
             :foreign_key => "merchants_id",
             :dependent => :destroy

  has_many   :coupons,
             :foreign_key => "merchants_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :purchased_products,
             :through => :products,
             :source => :purchased_products

  has_many   :customers_dealings,
             :through => :purchased_products,
             :source => :customers

  # Validations

  # Scopes

  def to_s
    created_at
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
