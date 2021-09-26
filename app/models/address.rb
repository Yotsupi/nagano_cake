class Address < ApplicationRecord
  validates :postal_code, numericality: true
  belongs_to :customer
end
