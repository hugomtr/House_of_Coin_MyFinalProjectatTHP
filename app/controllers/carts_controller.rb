class CartsController < ApplicationController
    def index
        @house_coins = current_order.house_coins
    end

    def destroy
        @order = Order.find(params[:id]) 
        @order.house_coins.each do | hc |
            hc.destroy
        end
        redirect_to root_path
    end
end
