class CartItemsController < ApplicationController

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.save
    redirect_to cart_items_path
  end

  def index
    @cart_items = CartItem.all
    @total = 0
  end

  def update
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def empty
  end

    private
  def cart_item_params
      params.permit(:amount, :item_id, :customer_id)
  end

end
