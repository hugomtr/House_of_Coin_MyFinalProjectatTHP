class RealEstate < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :user
  has_many :house_coins

  def coin_price
    self.price / 50 # Arbitrary value for testing
  end
end
