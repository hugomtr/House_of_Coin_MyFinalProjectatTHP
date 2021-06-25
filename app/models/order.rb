class Order < ApplicationRecord
  has_many :house_coins

  def order_total
    total = 0
    self.house_coins.each do | hc |
      total += hc.coin_price
    end
    return total.to_i 
  end

  private
  def buyer_housecoin
    AdminMailer.buyer_housecoin(self.user_id, self.order_id).deliver_now
  end
end
