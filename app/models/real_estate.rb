class RealEstate < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many_attached :pictures

  belongs_to :user
  has_many :house_coins

  validates :adress ,presence: true
  validates :zipcode ,presence: true
  validates :city ,presence: true

  # For show the latest real estates
  # scope :latest_estate, order('created_at DESC')
  scope :lastest_estate, -> { order(created_at: :desc) }

  #TODO reactivate mailers

  # after_create :announce_validation_confirm, :original_coin_number
  after_create :original_coin_number

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
    if price_euros <= 100000
    house_coins_num = 100
    elsif price_euros > 100000 && price_euros < 500000
    house_coins_num = 200
    elsif price_euros > 500000 && price_euros < 1000000
    house_coins_num = 300
    elsif price_euros > 1000000
    house_coins_num = 400
    end
    self.update(original_house_coin_number: house_coins_num)
    self.update(current_house_coin_number: house_coins_num)
    
  end

  def announce_validation_confirm
    AdminMailer.announce_validation(self).deliver_now
  end

end
