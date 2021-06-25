class Subscriber < ApplicationRecord
    validates :email, presence: true
    validates :email, format: {
        with: /\A([\w\._-]+)@([\w-]+)\.(\w+)\z/,
        message: 'not valid'
        }
end