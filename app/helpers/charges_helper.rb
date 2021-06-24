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
            estate_coin_num = real_estate.current_house_coin_number - 1
            real_estate.update(current_house_coin_number: estate_coin_num)
            hc.update(user: current_user)
        end
    end
    
    def is_available_to_buy?
        houses=current_order.house_coins.map{|u| u.real_estate}
        houses.each do |house| 
            if house.current_house_coin_number + houses.count(house) > house.original_house_coin_number
                return false
            end
        end
    end
end
