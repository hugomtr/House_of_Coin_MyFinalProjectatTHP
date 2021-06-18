class ChatroomController < ApplicationController

  before_action :authenticate_user!

  def index
    @real_estate = find_real_estate
    @investors  = find_investors(@real_estate)
    @messages = find_investors_messages(@real_estate)
  end

  def create 
    @message = current_user.messages.build(message_params)
    if @message.save
      puts "OK"
      render :index
      #redirect_back(fallback_location:root_path)
    else
      puts @message.errors.messages
      render :index
    end

    #@real_estate = find_real_estate
  end
  
  private
  def message_params
    params.require(:message).permit(:body)
  end

  def find_real_estate
    return RealEstate.find(params[:real_estate_id])
  end
  
end