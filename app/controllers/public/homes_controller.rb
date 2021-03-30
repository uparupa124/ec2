class Public::HomesController < ApplicationController

def top
  @item = Item.all.order(created_at: :desc)
  @item = @item.first(4)
  
end

def about
end
end
