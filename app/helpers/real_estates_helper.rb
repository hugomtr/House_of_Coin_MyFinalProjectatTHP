module RealEstatesHelper
  def is_available?(real_estate)
    if real_estate.current_house_coin_number <= 0
      return false
    end
    return true
  end
end
