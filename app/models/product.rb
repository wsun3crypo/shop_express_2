require "open-uri"
class Product < ApplicationRecord
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
  # Direct associations

  has_many   :purchased_products,
             foreign_key: "products_id"

  belongs_to :merchants,
             class_name: "Merchant"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    merchants.to_s
  end
end
