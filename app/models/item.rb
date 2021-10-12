class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_items
  belongs_to :genre

  def with_tax_price
    (price * 1.1).floor
  end

  attachment :image
end
