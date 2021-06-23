# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# ActionMailer::Base.smtp_settings = {
#     :user_name => ENV['SENDGRID_LOGIN'],
#     :password => ENV['SENDGRID_PWD'],
#     :domain => 'monsite.fr',
#     :address => 'smtp.sendgrid.net',
#     :port => 587,
#     :authentication => :plain,
#     :enable_starttls_auto => true
# }

# SMTP settings for gmail
ActionMailer::Base.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :user_name            => ENV['GMAIL_USERNAME'],
    :password             => ENV['GMAIL_PWD'],
    :authentication       => "plain",
    :enable_starttls_auto => true
  }