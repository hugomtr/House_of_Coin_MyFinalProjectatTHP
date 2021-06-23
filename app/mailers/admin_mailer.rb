class AdminMailer < ApplicationMailer
    
    def admin_offer_creation(real_estate)
        admin_array = User.where(is_admin?: true)
        admin_array.each do |admin|
            @admin = admin
            @real_estate = real_estate
            mail(to: ENV['GMAIL_USERNAME'], subject: "Summary of the offer") 
        end
    end

end
