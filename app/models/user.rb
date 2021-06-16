class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :house_coins
  has_many :real_estates
  has_many :charges
  has_many :orders ,through: :charges
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :welcome_send

  private
    def welcome_send
      UserMailer.welcome_email(self).deliver_now
    end
end
