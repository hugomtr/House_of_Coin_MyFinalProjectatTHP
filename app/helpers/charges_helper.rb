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
end
