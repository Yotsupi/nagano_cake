class OrdersController < ApplicationController
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
  end

  def create
    order = Order.new(order_params)
    order.save
    redirect_to thanks_path
  end

  def thanks
  end


  private
  def order_params
    params.require(:order).permit(:name, :postal_code, :address, :payment, :billing_amount, :postage, :status, :address_id)
  end

end
