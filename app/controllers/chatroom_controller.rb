class ChatroomController < ApplicationController

  before_action :authenticate_user!

  def index
    @real_estate = RealEstate.find(params[:real_estate_id])
    @investors  = find_investors(@real_estate)
    @messages = find_investors_messages(@real_estate)
  end

end
