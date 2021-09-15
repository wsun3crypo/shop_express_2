class CreateLoyaltyPrograms < ActiveRecord::Migration[6.0]
  def change
    create_table :loyalty_programs do |t|
      t.integer :merchants_id
      t.integer :customers_id

      t.timestamps
    end
  end
end
