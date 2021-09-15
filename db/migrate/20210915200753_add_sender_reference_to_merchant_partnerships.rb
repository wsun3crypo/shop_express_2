class AddSenderReferenceToMerchantPartnerships < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :merchant_partnerships, :merchants, column: :sender_id
    add_index :merchant_partnerships, :sender_id
    change_column_null :merchant_partnerships, :sender_id, false
  end
end
