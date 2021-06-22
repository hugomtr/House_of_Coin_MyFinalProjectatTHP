class UserMailer < ApplicationMailer
    default from: 'ced@yopmail.com'

    def welcome_email(user)
        @user = user 
        @url  = 'http://heroku.com/login' 
        mail(to: @user.email, subject: 'Welcome to House of Coin !') 
    end
    
    def registration_confirmation(user)
        @user = user
        mail(to: "#{user.name} <#{user.email}>", subject: 'Registration Confirmation')
    end

    def ad_validation(user)
        @user = user
        mail(to: @user.email, subject: 'Validation of your ad')
    end
end
