class RealEstatesController < ApplicationController
  def index
    @estates = estates_all
  end

  def new
  end

  def create
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

  def estate_all
    RealEstate.all
  end

  def estate_find
    RealEstate.find(params[:id])
  end
end
