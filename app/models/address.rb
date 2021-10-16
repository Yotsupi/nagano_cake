class Address < ApplicationRecord
  belongs_to :customer
  validates :postal_code, numericality: true

  def address_information
    "〒" + postal_code + " " + address + " " + name
  end
end
