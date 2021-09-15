class AddCustomersReferenceToAssignedCoupons < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :assigned_coupons, :customers, column: :customers_id
    add_index :assigned_coupons, :customers_id
    change_column_null :assigned_coupons, :customers_id, false
  end
end
