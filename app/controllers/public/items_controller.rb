class Public::ItemsController < ApplicationController
  def index
    @items = Item.where(is_active: 'true').page(params[:page]).per(4)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @tax_in_price = @item.price*1.1
  end

end
