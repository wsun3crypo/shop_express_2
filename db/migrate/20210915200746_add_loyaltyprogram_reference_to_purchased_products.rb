class AddLoyaltyprogramReferenceToPurchasedProducts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :purchased_products, :loyalty_programs,
                    column: :loyaltyprogram_id
    add_index :purchased_products, :loyaltyprogram_id
    change_column_null :purchased_products, :loyaltyprogram_id, false
  end
end
