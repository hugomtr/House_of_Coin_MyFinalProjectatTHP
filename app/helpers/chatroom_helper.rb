module ChatroomHelper
  def find_investors(real_estate)
    unique_users = []
    unique_users = HouseCoin.where(real_estate_id:real_estate).map{|u| u.user_id}
    return unique_users
  end
end
