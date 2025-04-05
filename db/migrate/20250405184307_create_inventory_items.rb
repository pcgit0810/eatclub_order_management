class CreateInventoryItems < ActiveRecord::Migration[5.0]
  def change
    create_table :inventory_items do |t|
      t.string :name
      t.integer :quantity
      t.integer :threshold

      t.timestamps
    end
  end
end
