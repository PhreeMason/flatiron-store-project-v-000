class LineItemsController < ApplicationController
    
    def create
        if current_cart
            current_cart.add_item(params[:item_id])
        else
            current_user.add_cart.add_item(params[:item_id])
        end
        current_cart.save
        redirect_to current_cart
    end

end
