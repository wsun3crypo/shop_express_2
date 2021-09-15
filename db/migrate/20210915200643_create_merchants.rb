class CreateMerchants < ActiveRecord::Migration[6.0]
  def change
    create_table :merchants do |t|
      t.string :name
      t.string :description
      t.integer :address
      t.string :tel
      t.string :picture

      t.timestamps
    end
  end
end
