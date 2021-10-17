class RemoveAddressIdFromOrder < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :address_id, :integer
  end
end
