class AddMerchantsReferenceToLoyaltyPrograms < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :loyalty_programs, :merchants, column: :merchants_id
    add_index :loyalty_programs, :merchants_id
    change_column_null :loyalty_programs, :merchants_id, false
  end
end
