class CreateCustomerFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_friends do |t|
      t.integer :sender_id
      t.integer :receiver_id

      t.timestamps
    end
  end
end
