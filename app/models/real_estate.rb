class RealEstate < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  has_many :house_coins

  validates :adress ,presence: true
  validates :zipcode ,presence: true
  validates :city ,presence: true

  #after_create :announce_validation_confirm

  def coin_price
    self.price / 50 # Arbitrary value for testing
  end
  
  geocoded_by :full_address
  after_validation :geocode
  
  def full_address
    "#{adress} ,#{zipcode}, #{city}"
  end
  
  private

  def announce_validation
    AdminMailer.announce_validation(self).deliver_now
  end
  
end
