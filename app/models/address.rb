class Address < ApplicationRecord
  belongs_to :customer
  validates :postal_code, numericality: true
end
