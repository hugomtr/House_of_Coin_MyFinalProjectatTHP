class UserMailer < ApplicationMailer
    default from: 'no-reply@monsite.fr'

    def welcome_email(user)
        @user = user 
        @url  = 'http://monsite.fr/login' 
        mail(to: @user.email, subject: 'Bienvenue chez nous !') 
    end
    
    def registration_confirmation(user)
        @user = user
        mail(:to => "#{user.name} <#{user.email}>", :subject => "Registration Confirmation")
    end
end
