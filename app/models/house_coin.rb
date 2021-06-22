class HouseCoin < ApplicationRecord
  belongs_to :order
  belongs_to :real_estate
  belongs_to :user
  
  before_create :sufficent_house_coin_num?

  private

  def sufficient_house_coin_num?
    num = RealEstate.find(self.real_estate_id)
    if num.current_house_coin_number <= 0
      return false
    end
  end

end
