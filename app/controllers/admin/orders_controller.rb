class Admin::OrdersController < ApplicationController



  def show
    @order = Order.find(params[:id])
     if @order.payment == 1
      @payment = "クレジットカード"
     elsif @order.payment == 2
      @payment = "銀行振込"
     end
   @details = @order.details
  end
end
