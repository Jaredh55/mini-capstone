class User < ApplicationRecord
  has_secure_password
  has_many :orders
  has_many :carted_products
  # has_many :products, through: :carted_products
  validates :name, :presence => true
  validates :email, :presence => true
  validates :email, :uniqueness => true
  # validates :password, :presence => true
  # validates :password, length: {in: 6..20}

  def current_cart
    carted_products.where(status: "carted")
  end
end
