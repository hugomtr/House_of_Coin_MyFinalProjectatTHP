class ChatroomController < ApplicationController
  def index
    @real_estate = RealEstate.find(params[:real_estate_id])
    @messages = find_investors_messages(@real_estate)
  end

end
