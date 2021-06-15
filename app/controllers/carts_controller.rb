class CartsController < ApplicationController
    def index
        @house_coins = current_order.house_coins
    end
end
