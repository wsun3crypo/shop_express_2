class AddPictureLatitudeToMerchant < ActiveRecord::Migration[6.0]
  def change
    add_column :merchants, :picture_latitude, :float
  end
end
