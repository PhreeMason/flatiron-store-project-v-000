class StoreController < ApplicationController
  def index
      if current_cart
        @current_cart = current_cart 
      end
      @categories = Category.all
      @items = Item.available_items
  end
end
