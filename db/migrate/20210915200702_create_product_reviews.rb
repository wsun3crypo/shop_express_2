class CreateProductReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :product_reviews do |t|
      t.string :review
      t.integer :customers_id

      t.timestamps
    end
  end
end
