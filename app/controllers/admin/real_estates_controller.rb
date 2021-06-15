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
    @real_estate = estate_find
  end

  def update
    @real_estate = estate_find

    if @real_estate.update(estate_params)
      flash[:notice] = "Real estate updated!"
      redirect_to admin_real_estates_path
    else
      flash.now[:notice] = "Ouppps !"
      render :edit
    end
  end

  def destroy
  end

  private

  def estates_all
    RealEstate.all
  end

  def estate_find
    RealEstate.friendly.find(params[:id])
  end

  def estate_params
      params.permit(:name, :price, :description, :adress, :zipcode, :city, :geocode)
  end
end
