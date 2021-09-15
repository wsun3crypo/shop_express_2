class AddPictureFormattedAddressToMerchant < ActiveRecord::Migration[6.0]
  def change
    add_column :merchants, :picture_formatted_address, :string
  end
end
