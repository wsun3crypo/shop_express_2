class AddReceiverReferenceToMerchantPartnerships < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :merchant_partnerships, :merchants, column: :receiver_id
    add_index :merchant_partnerships, :receiver_id
    change_column_null :merchant_partnerships, :receiver_id, false
  end
end
