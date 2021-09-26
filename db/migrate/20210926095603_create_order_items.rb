class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :price
      t.integer :amount
      t.integer :making_status, null: false, default: 0
      t.timestamps
    end
  end
end
