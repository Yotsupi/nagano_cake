class OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = Address.all
  end

  def create
    order = Order.new(order_params)
    order.save
    redirect_to confirm_path
  end

  def confirm
  @order = Order.new(order_params)
  if params[:order][:address] == "0"
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.name

    elsif params[:order][:address] == "1"
    @address = Address.find(params[:order][:address_id])
    @order.address = @address.address

    end
  end

  def thanks
  end


  private
  def order_params
    params.require(:order).permit(:name, :postal_code, :address, :payment, :billing_amount, :postage, :status, :address_id)
  end

end
