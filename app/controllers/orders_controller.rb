class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    order = Order.new(order_params)
    order.save
    redirect_to confirm_path
  end

  def confirm
    @order = Order.find(params[:id])
  end
  
  def thanks
  end


  private
  def order_params
    params.require(:order).permit(:name, :postal_code, :address, :payment, :billing_amount, :postage, :status)
  end

end
