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

  # validate :attachment_presence

  # For show the latest real estates
  scope :lastest_estate, -> { order(created_at: :desc) }

  #TODO reactivate mailers
  after_update :offer_validation
  after_create :admin_offer_creation_mail, :original_coin_number

  scope :lastest_estate, -> { order(created_at: :desc) }

  def thumbnail input
    return self.pictures[input].variant(resize: '500x500').processed
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
    elsif self.price >= 500000 && self.price < 1000000
    house_coins_num = 300
    elsif self.price >= 1000000
    house_coins_num = 400
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

  # def attachment_presence
  #   if self.pictures.present?
  #     return true
  #   else
  #     errors[:pictures] << "Your offer must have pictures."
  #   end
  # end

end
