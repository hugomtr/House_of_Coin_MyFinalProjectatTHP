class RealEstatesController < ApplicationController
  def index
    @estates = estates_all

    @markers = estates_all.geocoded.map do |mark|
      {
        lat: mark.latitude,
        lng: mark.longitude,
        adress: mark.adress,
        price: mark.price
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

  def estate_find
    RealEstate.friendly.find(params[:id])
  end
end
