class AddNewAddressToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :new_address, :string
  end
end
