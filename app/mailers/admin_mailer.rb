class AdminMailer < ApplicationMailer
    def announce_validation(real_estate)
        admin_array = User.where(is_admin: true)
        admin_array.each do |admin|
            @admin = admin
            @real_estate = real_estate
            mail(to: @admin.email, subject: "Summary of the announcement") 
        end
    end
end
