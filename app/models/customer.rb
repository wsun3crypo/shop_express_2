class Customer < ApplicationRecord
  # Direct associations

  has_many   :assigned_coupons,
             :foreign_key => "customers_id",
             :dependent => :destroy

  has_many   :received_many_friends_request,
             :class_name => "CustomerFriend",
             :foreign_key => "receiver_id",
             :dependent => :destroy

  has_many   :sent_many_friends_request,
             :class_name => "CustomerFriend",
             :foreign_key => "sender_id",
             :dependent => :destroy

  has_many   :loyalty_programs,
             :foreign_key => "customers_id",
             :dependent => :destroy

  has_many   :purchased_products,
             :foreign_key => "customers_id",
             :dependent => :destroy

  # Indirect associations

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
