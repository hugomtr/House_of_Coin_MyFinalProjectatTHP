module ChatroomHelper

  def find_investors(real_estate)
    sql="select distinct user_id 
      from house_coins H 
      where H.real_estate_id=#{real_estate.id}"
    records_array = ActiveRecord::Base.connection.execute(sql)
    return records_array   
  end
  def find_investors_messages(real_estate)
    sql = "select distinct * from messages where messages.real_estate_id=#{real_estate.id}
            order by created_at";
    records_array = ActiveRecord::Base.connection.execute(sql)
    return records_array
  end
end
