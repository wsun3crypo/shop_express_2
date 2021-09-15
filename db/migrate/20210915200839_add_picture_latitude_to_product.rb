class AddPictureLatitudeToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :picture_latitude, :float
  end
end
