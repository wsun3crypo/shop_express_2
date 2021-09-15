class AddPurchasedProductCountToCoupons < ActiveRecord::Migration[6.0]
  def change
    add_column :coupons, :purchased_products_count, :integer
  end
end
