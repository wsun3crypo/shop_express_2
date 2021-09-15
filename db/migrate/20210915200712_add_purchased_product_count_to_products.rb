class AddPurchasedProductCountToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :purchased_products_count, :integer
  end
end
