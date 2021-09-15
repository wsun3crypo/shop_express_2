class AddCouponsReferenceToPurchasedProducts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :purchased_products, :coupons, column: :coupons_id
    add_index :purchased_products, :coupons_id
  end
end
