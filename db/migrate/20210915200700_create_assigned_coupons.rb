class CreateAssignedCoupons < ActiveRecord::Migration[6.0]
  def change
    create_table :assigned_coupons do |t|
      t.integer :coupons_id
      t.integer :customers_id

      t.timestamps
    end
  end
end
