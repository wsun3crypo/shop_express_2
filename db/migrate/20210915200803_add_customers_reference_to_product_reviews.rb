class AddCustomersReferenceToProductReviews < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :product_reviews, :customers, column: :customers_id
    add_index :product_reviews, :customers_id
    change_column_null :product_reviews, :customers_id, false
  end
end
