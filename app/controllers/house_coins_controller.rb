class HouseCoinsController < ApplicationController
    def create
        @order = current_order
        @house_coin = @order.house_coins.new(order_params)

        if @order.save
            session[:order_id] = @order.id
            redirect_to root_path
        else
            puts @order.errors.messages
            flash[:notice] = @order.errors.full_messages
            redirect_to root_path
        end
    end

    def update
        @order = current_order
        @house_coin = @order.house_coins.find(params[:id])
        @house_coin.update_attributes(order_params)
        @house_coins = @order.house_coins
    end

    def destroy
        @order = current_order
        @house_coin = @order.house_coins.find(params[:id])
        @house_coin.destroy
        @house_coins = @order.house_coins

        redirect_back(fallback_location: root_path)
    end

    private

    def order_params
        # user_id is the original good seller, the coin property will switch
        # to current user after payment.
        params.permit(:real_estate_id, :coin_price, :user_id, :order_id)
    end
end
