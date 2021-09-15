class AddCustomersReferenceToLoyaltyPrograms < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :loyalty_programs, :customers, column: :customers_id
    add_index :loyalty_programs, :customers_id
    change_column_null :loyalty_programs, :customers_id, false
  end
end
