class SubscriberMailer < ApplicationMailer
    default from: 'houseofcoins2021@gmail.com'
    layout 'mailer'
    
    def subscriber_newsletter(subscriber)
        @subscriber = subscriber  
        mail(to: @subscriber.email, subject: 'Welcome to newsletter House of Coin!') 
    end

end
