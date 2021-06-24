module ChargesHelper
    def total_charge(order)
        unless order.house_coins.length == 0
            total = 0 
            order.house_coins.each do |order_item|
                total += order_item.coin_price 
            end
            return total
        end
    end

    def update_products(order)
        order.house_coins.each do | hc |
            real_estate = RealEstate.find(hc.real_estate_id)
            #estate_coin_num = real_estate.current_house_coin_number - 1
            #real_estate.update(current_house_coin_number: estate_coin_num)
            hc.update(user: current_user)
        end
    end
end
