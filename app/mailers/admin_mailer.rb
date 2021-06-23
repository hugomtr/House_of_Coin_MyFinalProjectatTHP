class AdminMailer < ApplicationMailer
    
    def announce_validation(real_estate)
        admin_array = User.where(is_admin?: true)
        admin_array.each do |admin|
            @admin = admin
            @real_estate = real_estate
            mail(to: @admin.email, subject: "Summary of the announcement") 
        end
    end

    def buyer_housecoin(order)
        admin_array = User.where(is_admin: true)
        admin_array.each do |admin|
            @admin = admin
            @house_coins = order.house_coins
            mail(to: @admin.email, subject: 'A new HouseCoin sale') 
        end
    end
end
