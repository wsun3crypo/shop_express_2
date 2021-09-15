class AddMerchantsReferenceToProducts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :products, :merchants, column: :merchants_id
    add_index :products, :merchants_id
    change_column_null :products, :merchants_id, false
  end
end
