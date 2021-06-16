class Admin::RealEstatesController < ApplicationController
  before_action :is_admin?, :user_signed_in?

  def index
    @estates = estates_all
  end

  def new
  end

  def create
    @estate = RealEstate.new(estate_params)
    @estate.user = current_user
    
    puts "*"*40
    puts params[:pictures].length
    puts params[:pictures]

    if @estate.save
      flash[:notice] = "Real estate created!"
      @estate.pictures.attach(params[:pictures])
      redirect_to admin_real_estates_path
    else
      puts "*"*40
      puts @estate.errors.messages
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
    @real_estate = estate_find
    @real_estate.destroy
    redirect_to admin_real_estates_path
  end

  private

  def estates_all
    RealEstate.all
  end

  def estate_find
    RealEstate.friendly.find(params[:id])
  end

  def estate_params
      params.permit(
        :name,
        :price,
        :description,
        :adress,
        :zipcode,
        :city,
        :geocode,
        pictures: []
      )
  end
end
