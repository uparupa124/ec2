class Public::ItemsController < ApplicationController

 def index
    @item = Item.page(params[:page]).reverse_order.per(8)
 end
  
  def show
    @numbers = [["1","1"], ["2","2"], ["3","3"], ["4","4"], ["5","5"], ["6","6"], ["7","7"], ["8","8"], ["9","9"], ["10","10"]]
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
