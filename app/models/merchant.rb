class Merchant < ApplicationRecord
  # Direct associations

  has_many   :products,
             :foreign_key => "merchants_id",
             :dependent => :destroy

  has_many   :coupons,
             :foreign_key => "merchants_id",
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
