class UserMailer < ApplicationMailer
    default from: 'ced@yopmail.com'

    def welcome_email(user)
        @user = user 
        @url  = 'http://heroku.com/login' 
        mail(to: @user.email, subject: 'Bienvenue chez nous !') 
    end
    
    def registration_confirmation(user)
        @user = user
        mail(:to => "#{user.name} <#{user.email}>", :subject => "Registration Confirmation")
    end
end
