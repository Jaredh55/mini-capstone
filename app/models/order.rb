class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  def calculate_subtotal(temp_carted_products)
    temp_subtotal = 0
    carted_products.each do |carted_product|
    temp_subtotal += carted_product.product.price * carted_product.quantity
    end
    self.subtotal = temp_subtotal
  end

  def calculate_tax
    self.tax = @order.subtotal * 0.09
  end

  def calculate_total
    self.total = subtotal + tax
  end

  def calculate_cart
    user.current_cart.update_all(status: "purchased", order_id: @order_id)
    calculate_subtotal(carted_products)
    calculate_tax
    calculate_total
    save
  end 

  # def calculate_subtotal
  # 	self.subtotal = product.price * quantity
  # end

  # def calculate_tax
  # 	self.tax = subtotal * 0.09
  # end

  # def calculate_total
  # 	self.total = subtotal + tax
  # end

  # def calculate_totals
  # 	calculate_subtotal
  # 	calculate_tax
  # 	calculate_total
  # end

  def purchased_on
  	created_at.strftime('%A, %d %b %Y %l:%M %p')
  end
end
