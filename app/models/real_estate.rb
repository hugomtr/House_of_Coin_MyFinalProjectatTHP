class RealEstate < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many_attached :pictures

  belongs_to :user
  has_many :house_coins
  has_many :real_estates

  validates :name, presence: true
  validates :price, presence: true
  validates :adress ,presence: true
  validates :zipcode ,presence: true
  validates :city ,presence: true

  #TODO reactivate mailers
  after_update :offer_validation
  after_create :admin_offer_creation_mail, :original_coin_number

  def thumbnail input
    return self.pictures[input].variant(resize: '500x500').processed
  end

  def coin_price
    coin_value = ((self.price.to_f / self.original_house_coin_number)*100)/100 # The returned value must be in cents
  end

  geocoded_by :full_address
  after_validation :geocode

  def full_address
    "#{adress} ,#{zipcode}, #{city}"
  end

  private

  def original_coin_number
    if self.price <= 100000
    house_coins_num = 10
    elsif self.price > 100000 && self.price < 500000
    house_coins_num = 20
    elsif self.price >= 500000 && self.price < 1000000
    house_coins_num = 30
    elsif self.price >= 1000000
    house_coins_num = 40
    end
    self.update(original_house_coin_number: house_coins_num)
    self.update(current_house_coin_number: house_coins_num)
  end

  def admin_offer_creation_mail
    AdminMailer.admin_offer_creation(self).deliver_now
  end

  def offer_validation
    UserMailer.offer_validation(self.user_id).deliver_now
  end
end
