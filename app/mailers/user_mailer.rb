class UserMailer < ApplicationMailer
    default from: 'houseofcoins2021@gmail.com'

    def welcome_email(user)
        @user = user 
        @url  = 'http://heroku.com/login' 
        mail(to: @user.email, subject: 'Welcome to House of Coin !') 
    end
    
    def registration_confirmation(user)
        @user = user
        mail(to: "#{user.name} <#{user.email}>", subject: 'Registration Confirmation')
    end

    def offer_validation(user)
        @user = User.find(user) 
        mail(to: @user.email, subject: 'Validation of your offer')
    end
end
