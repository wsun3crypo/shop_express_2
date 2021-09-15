class AddCustomersReferenceToPurchasedProducts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :purchased_products, :customers, column: :customers_id
    add_index :purchased_products, :customers_id
    change_column_null :purchased_products, :customers_id, false
  end
end
