class ChatroomController < ApplicationController

  before_action :authenticate_user!

  def index
    @real_estate = find_real_estate
    @investors  = find_investors(@real_estate)
    @messages = find_investors_messages(@real_estate)
  end

  def create 
    @message= Message.new(real_estate_id:params[:real_estate_id])
    @message.update(user_id:current_user.id,body:message_params[:body])
    respond_to do |format|
      format.html {redirect_to real_estate_chatroom_index_path(params[:real_estate_id])}
      format.js {}
    end
    if !@message.save
      puts @message.errors.messages
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:body)
  end

  def find_real_estate
    return RealEstate.find(params[:real_estate_id])
  end
end