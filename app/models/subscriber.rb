class Subscriber < ApplicationRecord
    validates :email, presence: true
    validates :email, format: {
        with: /\A([\w\._-]+)@([\w-]+)\.(\w+)\z/,
        message: 'not valid'
        }

    after_create :subscriber_send

    def subscriber_send
        SubscriberMailer.subscriber_newsletter(self).deliver_now 
    end
end