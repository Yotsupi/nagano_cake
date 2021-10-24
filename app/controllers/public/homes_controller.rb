class Public::HomesController < ApplicationController
  def top
    @items = Item.find(1,2,3,4)
  end

  def about
  end

end
