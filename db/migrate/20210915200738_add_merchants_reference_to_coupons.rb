class AddMerchantsReferenceToCoupons < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :coupons, :merchants, column: :merchants_id
    add_index :coupons, :merchants_id
    change_column_null :coupons, :merchants_id, false
  end
end
