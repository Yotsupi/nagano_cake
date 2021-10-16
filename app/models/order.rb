class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy

  enum payment: { credit_card: 0, transfer: 1 }

  def address_information
    "〒" + postal_code + " " + address + " " + name
  end
end
