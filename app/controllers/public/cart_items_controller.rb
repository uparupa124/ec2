class Public::CartItemsController < ApplicationController

 def index
  @numbers = [["1","1"], ["2","2"], ["3","3"], ["4","4"], ["5","5"], ["6","6"], ["7","7"], ["8","8"], ["9","9"], ["10","10"]]
  @cart_items = current_customer.cart_items
 end

 def create
   @cart_item = current_customer.cart_items.new(cart_item_params)
   @cart_items = current_customer.cart_items.all
   @cart_items.each do |cart_item|
    if cart_item.item_id == @cart_item.item_id
     p cart_item
     new_amount = cart_item.amount + @cart_item.amount
     cart_item.update_attribute(:amount, new_amount)
     @cart_item.delete
    end
   end
      if @cart_item.save
        redirect_to cart_items_path
      else
        @item = Item.find(params[:id])
        render "public/items/show"
      end
 end
 
 def update
  @cart_item = CartItem.find(params[:id])
  @cart_item.update(amount: params[:cart_item][:amount])
  redirect_to cart_items_path
 end
 
 def destroy
  @cart_item = CartItem.find(params[:id])
  @cart_item.destroy
  redirect_to cart_items_path
 end
 
 def destroy_all
  @cart_item = current_customer.cart_items
  @cart_item.destroy_all
  redirect_to cart_items_path
 end
 
  private
   def cart_item_params
     params.require(:cart_item).permit(:amount, :item_id)
   end
end
