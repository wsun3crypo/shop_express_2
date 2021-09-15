class AddProductsreviewReferenceToPurchasedProducts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :purchased_products, :product_reviews, column: :productsreview_id
    add_index :purchased_products, :productsreview_id
    change_column_null :purchased_products, :productsreview_id, false
  end
end
