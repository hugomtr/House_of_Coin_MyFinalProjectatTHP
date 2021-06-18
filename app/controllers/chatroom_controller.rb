class ChatroomController < ApplicationController

  before_action :authenticate_user!

  def index
    @message = Message.new(user_id:current_user.id)
    @real_estate = RealEstate.find(params[:real_estate_id])
    @investors  = find_investors(@real_estate)
    @messages = find_investors_messages(@real_estate)
  end

  def create 
    message = current_user.messages.build(message_params)
  end
  
  private
  def message_params
    params.require(:message).permit(:body)
  end
  
end