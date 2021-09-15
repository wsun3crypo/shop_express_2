require "open-uri"
class Merchant < ApplicationRecord
  before_validation :geocode_picture

  def geocode_picture
    if picture.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(picture)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.picture_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.picture_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.picture_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end

  include JwtToken
  # Direct associations

  has_many   :received_partnership_request,
             class_name: "MerchantPartnership",
             foreign_key: "receiver_id",
             dependent: :destroy

  has_many   :partnership_request,
             class_name: "MerchantPartnership",
             foreign_key: "sender_id",
             dependent: :destroy

  has_many   :loyalty_members,
             class_name: "LoyaltyProgram",
             foreign_key: "merchants_id",
             dependent: :destroy

  has_many   :products,
             foreign_key: "merchants_id",
             dependent: :destroy

  has_many   :coupons,
             foreign_key: "merchants_id",
             dependent: :destroy

  # Indirect associations

  has_many   :senders,
             through: :received_partnership_request,
             source: :sender

  has_many   :receivers,
             through: :partnership_request,
             source: :receiver

  has_many   :purchased_products,
             through: :products,
             source: :purchased_products

  has_many   :customers_dealings,
             through: :purchased_products,
             source: :customers

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
