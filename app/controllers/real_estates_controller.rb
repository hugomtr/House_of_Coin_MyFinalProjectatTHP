class RealEstatesController < ApplicationController
  def index
    @real_estates = RealEstate.all
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

  def estate_find
    RealEstate.friendly.find(params[:id])
  end

end
