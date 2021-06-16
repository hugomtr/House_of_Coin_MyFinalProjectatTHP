class RealEstate < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many_attached :pictures

  belongs_to :user
  has_many :house_coins

  validates :adress ,presence: true
  validates :zipcode ,presence: true
  validates :city ,presence: true

  after_create :announce_validation_confirm, :original_coin_number

  def pictures_urls
    pictures.map(&:url)
  end

  def price_euros
    price_euros = self.price / 100
  end

  def coin_price
    coin_value = (price_euros / self.original_house_coin_number) * 100 # The returned value must be in cents
  end

  geocoded_by :full_address
  after_validation :geocode

  def full_address
    "#{adress} ,#{zipcode}, #{city}"
  end
  
  private

  def original_coin_number
    house_coins_num = price_euros / 50 # We want our house_coins to cost 50 €
    self.update(original_house_coin_number: house_coins_num)
    self.update(current_house_coin_number: house_coins_num)
  end

  def announce_validation_confirm
    AdminMailer.announce_validation(self).deliver_now
  end

end
