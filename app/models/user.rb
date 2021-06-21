class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :house_coins
  has_many :real_estates
  has_many :charges
  has_many :orders ,through: :charges
  has_many :messages
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #TODO reactivate mailers

  # before_create :confirmation_token
  # after_create :welcome_send

  private
    def welcome_send
      UserMailer.welcome_email(self).deliver_now
    end

    def confirmation_token
      if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end

    def email_activate
      self.email_confirmed = true
      self.confirm_token = nil
      save!(:validate => false)
    end
    
end
