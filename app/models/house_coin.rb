class HouseCoin < ApplicationRecord
  belongs_to :order
  belongs_to :real_estate
  belongs_to :user
  
  validate :sufficient_house_coin_num?

  def sufficient_house_coin_num?
    num = RealEstate.find(self.real_estate_id)
    if num.house_coin_number >= 
      return false
    end
  end

end
