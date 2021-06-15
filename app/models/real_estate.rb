class RealEstate < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :user
  has_many :house_coins

  after_create :announce_validation_confirm

  def coin_number
    price_euros = self.price / 100
    house_coins_num = price_euros / 50 # We want our house_coins to cost 50 €
  end

  def coin_price
    price_euros = self.price / 100
    coin_value = (price_euros / coin_number) * 100 # The returned value must be in cents
  end

  private

  def announce_validation_confirm
    AdminMailer.announce_validation(self).deliver_now
  end

end
