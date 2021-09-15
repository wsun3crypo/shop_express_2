class AddPictureFormattedAddressToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :picture_formatted_address, :string
  end
end
