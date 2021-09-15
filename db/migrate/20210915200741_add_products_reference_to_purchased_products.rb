class AddProductsReferenceToPurchasedProducts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :purchased_products, :products, column: :products_id
    add_index :purchased_products, :products_id
    change_column_null :purchased_products, :products_id, false
  end
end
