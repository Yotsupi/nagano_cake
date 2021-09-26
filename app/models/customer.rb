class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :postal_code, numericality: true
  validates :telephone_number, numericality: true

  has_many :addresses, dependent :destroy
end
