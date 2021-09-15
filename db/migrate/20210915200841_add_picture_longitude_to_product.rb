class AddPictureLongitudeToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :picture_longitude, :float
  end
end
