class RealEstatesController < ApplicationController
  before_action :user_signed_in?, except: [:index, :show, :new]
  before_action :authenticate_user!, :estate_creator?, except: [:index, :show, :new, :create]

  def index
    @estates = estates_all

    @markers = @estates.geocoded.map do |mark|
      {
        coordinates: [mark.longitude,mark.latitude],
        adress: mark.adress,
        price: mark.price,
        id: mark.id,
      }
    end
  end

  def show
    @real_estate = estate_find
  end

  def new
    @real_estate = RealEstate.new
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
        redirect_to root_path
    else
        flash.now[:notice] = "Ouppps !"
        render :new
    end
  end

  def edit
    @real_estate = estate_find
  end

  def update
    @real_estate = estate_find

    if @real_estate.update(estate_params)
      flash[:notice] = "Real estate updated!"
      redirect_to root_path
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

  def estate_creator?
    unless estate_find.user == current_user
      flash[:notice] = "This is not your property!"
      redirect_to root_path
    end
  end

  def estate_params
      params.permit(:name, :price, :description, :adress, :zipcode, :city, :geocode)
  end
end
