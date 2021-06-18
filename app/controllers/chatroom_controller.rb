class ChatroomController < ApplicationController
  def index
    @real_estate = RealEstate.find(params[:real_estate_id])
    @investors = find_investors(@real_estate)
  end

end
