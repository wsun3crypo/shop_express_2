class CreateCoupons < ActiveRecord::Migration[6.0]
  def change
    create_table :coupons do |t|
      t.integer :merchants_id
      t.integer :amount
      t.date :expiry_date

      t.timestamps
    end
  end
end
