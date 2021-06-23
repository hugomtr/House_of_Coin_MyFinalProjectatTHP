class CartsController < ApplicationController
    def index
        @house_coins = current_order.house_coins
    end

    def destroy
        @flash = "Cart emptied!"
        @order = Order.find(params[:id]) 
        @order.house_coins.each do | hc |
            hc.destroy
        end

        respond_to do |format|
            format.html do 
                flash[:notice] = @flash
                redirect_to root_path
            end

            format.js do
            end
        end
    end
end
