class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :customer_name
      t.decimal :total_price
      t.string :status

      t.timestamps
    end
  end
end
