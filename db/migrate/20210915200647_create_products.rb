class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :merchants_id
      t.string :description
      t.string :picture
      t.string :price

      t.timestamps
    end
  end
end
