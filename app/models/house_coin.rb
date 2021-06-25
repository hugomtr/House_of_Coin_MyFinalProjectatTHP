class HouseCoin < ApplicationRecord
  belongs_to :order
  belongs_to :real_estate
  belongs_to :user
  
  validate :sufficient_house_coin_num?, on: :create


  def sufficient_house_coin_num?
    num = HouseCoin.where(real_estate_id:self.real_estate_id).length
    errors.add(:id) unless 
      num < self.real_estate.current_house_coin_number
  end
end
