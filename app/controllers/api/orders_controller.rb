class Api::OrdersController < ApplicationController
	def show
    	order_id = params[:id]
    	@order = Order.find(order_id)
    	render 'show.json.jbuilder'
  	end

  	def create
  	product = Product.find(params[:product_id])

  

    @order = Order.new(		
    						user_id: current_user.id,
                           	product_id: params[:product_id],
                           	quantity: params[:quantity]

                          )

    @order.calculate_totals

  	# @order.subtotal = @order.product.price * @order.quantity
  	# @order.tax = @order.subtotal * 0.09
  	# @order.total = @order.subtotal + @order.tax


    # product = Product.find(@order.product_id)
    # @order.subtotal = product.price * @order.quantity
    # @order.tax = product.tax * @order.quantity
    # @order.total = @order.subtotal + @order.tax

    @order.save
    render 'show.json.jbuilder'
end
end
