class CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def create
    @cart_items = CartItem.all
    @cart_item = CartItem.new(cart_item_params)
    @cart_items.each do |cart_item|
      if cart_item.item_id == @cart_item.item_id
        cart_item.amount += @cart_item.amount
        cart_item.update_attribute(:amount, cart_item.amount)
        @cart_item.destroy
      end
    end
    @cart_item.save
    redirect_to cart_items_path
  end

  def index
    @cart_items = CartItem.all
    @total = 0
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def empty
    cart_items = CartItem.all
    cart_items.destroy_all
    redirect_to cart_items_path
  end

    private
  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id, :customer_id)
  end

end
