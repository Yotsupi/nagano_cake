class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
   
  def index
    @orders = Order.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @total = 0
  end

end
