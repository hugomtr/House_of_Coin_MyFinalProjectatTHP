class Charge < ApplicationRecord
  belongs_to :user
  belongs_to :order

  after_create :buyer_charge_confirmation_mail

  private

  def buyer_charge_confirmation_mail
    UserMailer.buyer_charge_confirmation(self.user_id, self.order_id).deliver_now
  end
end
