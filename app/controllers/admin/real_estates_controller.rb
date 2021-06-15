class Admin::RealEstatesController < ApplicationController
  before_action :is_admin?, :user_signed_in?

  def index
    @estates = estates_all
  end

  def new
  end

  def create
    @estate = RealEstate.new(
        user: current_user,
        name: params[:name],
        description: params[:description],
        price: params[:price],
        adress: params[:adress],
        zipcode: params[:zipcode],
        city: params[:city],
        geocode: params[:geocode]
    )

    if @estate.save
        flash[:notice] = "Real estate created!"
        redirect_to admin_real_estates_path
    else
        flash.now[:notice] = "Ouppps !"
        render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def estates_all
    RealEstate.all
  end
end
