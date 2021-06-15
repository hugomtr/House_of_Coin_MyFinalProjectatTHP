class RealEstate < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :user
  has_many :house_coins

  after_create :announce_validation_confirm

  def coin_price
    self.price / 50 # Arbitrary value for testing
  end

  private

  def announce_validation_confirm
    AdminMailer.announce_validation(self).deliver_now
  end
  
end
