class AddReceiverReferenceToCustomerFriends < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :customer_friends, :customers, column: :receiver_id
    add_index :customer_friends, :receiver_id
    change_column_null :customer_friends, :receiver_id, false
  end
end
