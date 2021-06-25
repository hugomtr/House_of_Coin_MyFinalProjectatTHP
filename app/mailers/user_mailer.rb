class UserMailer < ApplicationMailer
    default from: 'houseofcoins2021@gmail.com'
    layout 'mailer'

    def welcome_email(user)
        @user = user 
        @url  = 'https://lets-buy-with-crypto.herokuapp.com/' 
        mail(to: @user.email, subject: 'Welcome to House of Coin !') 
    end

    def offer_validation(user)
        @user = User.find(user)
        @url  = 'https://lets-buy-with-crypto.herokuapp.com/'  
        mail(to: @user.email, subject: 'Validation of your offer')
    end

    def buyer_charge_confirmation(user, order)
        @user  = User.find(user)
        @order = Order.find(order)
        @url  = 'https://lets-buy-with-crypto.herokuapp.com/'
        mail(to: @user.email, subject: 'Confirmation of your order')
    end
end