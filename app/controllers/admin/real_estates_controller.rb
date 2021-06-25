class Admin::RealEstatesController < ApplicationController
  before_action :user_signed_in? 
  before_action :is_admin?

  def index
    @estates = estates_all
  end

  def new
  end

  def create
    @real_estate = RealEstate.new(estate_params)
    @real_estate.user = current_user

    if @real_estate.save
      flash[:notice] = "Real estate created!"
      @real_estate.pictures.attach(params[:pictures])
      redirect_to admin_real_estates_path
    else
      flash.now[:notice] = "Ouppps !"
      render :new
    end
  end

  def show
    @real_estate = estate_find
  end

  def edit
    @real_estate = estate_find
  end

  def update
    @real_estate = estate_find

    if @real_estate.update(estate_params)
      flash[:notice] = "Real estate updated!"
      if @real_estate.validated?
        UserMailer.offer_validation(@real_estate.user_id).deliver_now
      end
      respond_to do | format |
        format.html {
          redirect_to admin_real_estates_path
        }
        format.js {}
      end
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
        :id,
        :name,
        :price,
        :description,
        :adress,
        :zipcode,
        :city,
        :validated?,
        pictures: []
      )
  end

  def is_admin?
    return true if current_user.is_admin?

    redirect_to root_path
  end
end
