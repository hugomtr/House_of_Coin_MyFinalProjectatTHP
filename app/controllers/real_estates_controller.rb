class RealEstatesController < ApplicationController
  def index
    @estates = estates_all
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

  def estate_all
    RealEstate.all
  end

  def estate_find
    RealEstate.friendly.find(params[:id])
  end
end
