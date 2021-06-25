class SubscribersController < ApplicationController
  
  def create
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      cookies[:saved_subscriber] = true
      flash[:notice] = "Saved Successfully!"
      redirect_to root_path
    else 
      flash[:error] = "Failed to save"
      redirect_to root_path
    end
  end

  private

    def subscriber_params
      params.require(:subscriber).permit(:email)
    end
end
