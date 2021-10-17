class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :postal_code, numericality: true
  validates :telephone_number, numericality: true
  validates :email, uniqueness: true

  def name
    last_name + " " + first_name
  end

  def kana
    last_name_kana + " " + "first_name_kana"
  end

  def address_information
    "〒" + postal_code + " " + address + " " + name
  end

  def active_for_authentication?
    super && (self.is_active == true)
  end

end
