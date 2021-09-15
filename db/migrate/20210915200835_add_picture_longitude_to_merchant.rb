class AddPictureLongitudeToMerchant < ActiveRecord::Migration[6.0]
  def change
    add_column :merchants, :picture_longitude, :float
  end
end
