class Order < ApplicationRecord
  has_many :house_coins

  def order_total
    total = 0
    self.house_coins.each do | hc |
      total += hc.coin_price
    end
  end

end
