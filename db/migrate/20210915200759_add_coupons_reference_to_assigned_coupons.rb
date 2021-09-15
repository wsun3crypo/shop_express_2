class AddCouponsReferenceToAssignedCoupons < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :assigned_coupons, :coupons, column: :coupons_id
    add_index :assigned_coupons, :coupons_id
    change_column_null :assigned_coupons, :coupons_id, false
  end
end
