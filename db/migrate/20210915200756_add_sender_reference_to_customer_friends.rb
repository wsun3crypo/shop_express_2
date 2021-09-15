class AddSenderReferenceToCustomerFriends < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :customer_friends, :customers, column: :sender_id
    add_index :customer_friends, :sender_id
    change_column_null :customer_friends, :sender_id, false
  end
end
