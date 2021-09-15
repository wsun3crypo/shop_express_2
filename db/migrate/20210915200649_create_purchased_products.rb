class CreatePurchasedProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :purchased_products do |t|
      t.integer :products_id
      t.integer :coupons_id
      t.integer :customers_id
      t.string :quantity
      t.integer :loyaltyprogram_id
      t.integer :productsreview_id

      t.timestamps
    end
  end
end
