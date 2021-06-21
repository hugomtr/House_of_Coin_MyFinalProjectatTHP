class RealEstate < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many_attached :pictures

  belongs_to :user
  has_many :house_coins
  has_many :real_estates

  validates :adress ,presence: true
  validates :zipcode ,presence: true
  validates :city ,presence: true

  # For show the latest real estates
  scope :lastest_estate, -> { order(created_at: :desc) }

  #TODO reactivate mailers

  # after_create :announce_validation_confirm, :original_coin_number
  after_create :original_coin_number

  scope :lastest_estate, -> { order(created_at: :desc) }

  def thumbnail input
    return self.pictures[input].variant(resize: '300x300').processed
  end

  def coin_price
    coin_value = self.price / self.original_house_coin_number # The returned value must be in cents
  end

  geocoded_by :full_address
  after_validation :geocode

  def full_address
    "#{adress} ,#{zipcode}, #{city}"
  end
  
  private

  def original_coin_number
    if self.price <= 100000
    house_coins_num = 100
    elsif self.price > 100000 && self.price < 500000
    house_coins_num = 200
    elsif self.price > 500000 && self.price < 1000000
    house_coins_num = 300
    elsif self.price >= 1000000
    house_coins_num = 400
    end
    self.update(original_house_coin_number: house_coins_num)
    self.update(current_house_coin_number: house_coins_num)
    
  end

  def announce_validation_confirm
    AdminMailer.announce_validation(self).deliver_now
  end

end
