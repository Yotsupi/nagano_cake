class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :postal_code
      t.string :address
      t.integer :payment, null: false, default: 0
      t.integer :billing_amount
      t.integer :postage
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end
