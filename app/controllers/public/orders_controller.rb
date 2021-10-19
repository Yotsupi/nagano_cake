class Public::OrdersController < ApplicationController
   before_action :authenticate_customer!
   
  def new
    @order = Order.new
    @addresses = Address.all
  end

  def confirm
    @cart_items = CartItem.all
    @total = 0
    @order = Order.new(order_params)
    if params[:order][:address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.name

      elsif params[:order][:address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.address = @address.address
      @order.postal_code = @address.postal_code
      @order.name = @address.name

      elsif params[:order][:address] == "2"
      @order.address = params[:order][:new_address]
    end
    @order.customer_id = current_customer.id
    @order.postage = 800
    @order.billing_amount = @order.postage + @cart_items.sum{ |cart_item| cart_item.subtotal }
  end

  def create
    order = Order.new(order_params)
    order.save
    cart_items = CartItem.all
    cart_items.each do |cart_item|
      order_item = OrderItem.new
      order_item.order_id = order.id
      order_item.item_id = cart_item.item.id
      order_item.price = cart_item.item.price
      order_item.amount = cart_item.amount
      order_item.save
    end
    cart_items.destroy_all
    redirect_to thanks_path
  end

  def thanks
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @total = 0
  end


  private
  def order_params
    params.require(:order).permit(:name, :postal_code, :address, :payment, :billing_amount, :postage, :status, :customer_id)
  end

end
