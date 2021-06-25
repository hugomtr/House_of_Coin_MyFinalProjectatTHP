class RealEstatesController < ApplicationController
  before_action :user_signed_in?, except: [:index, :show, :new]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :estate_creator?, except: [:index, :show, :new, :create]
  before_action :estate_validated?, only: [:show]

  def index
    @estates = estates_all

    @markers = @estates.geocoded.map do |mark| {
      coordinates: [ mark.longitude, mark.latitude ],
      adress: mark.adress,
      price: mark.price,
      id: mark.id,
    }
    end
  end

  def show
    @estates_latest = latest_validated.max(4)
    @real_estate = estate_find
    @marker = {
      coordinates:
        [ @real_estate.longitude, @real_estate.latitude ],
        adress: @real_estate.adress,
        price: @real_estate.price,
        id: @real_estate.id
    }
  end

  def new
  end

  def create
    @real_estate = RealEstate.new(estate_params)
    @real_estate.user = current_user

    if @real_estate.save
      flash[:notice] = "Offer created"
      render :js => "window.location = '#{real_estates_path}'"
    else 
      flash[:error] = @real_estate.errors.full_messages 
      render :js => "window.location = '#{new_real_estate_path}'"
    end
  end

  def edit
    @real_estate = estate_find
  end

  def update
    @real_estate = estate_find

    if @real_estate.update(estate_params)
      flash[:notice] = "Real estate updated!"
      render :js => "window.location = '#{real_estates_path}'"
    else
      flash[:notice] = @real_estate.errors.full_messages 
      render :edit
      render :js => "window.location = '#{edit_real_estate_path(@real_estate.id)}'"
    end
  end

  def destroy
    @real_estate = estate_find
    @real_estate.destroy
    redirect_to root_path
  end

  private

  def estates_all
    RealEstate.all
  end

  def estate_find
    RealEstate.friendly.find(params[:id])
  end

  def estate_validated?
    unless estate_find.validated? || current_user.id == estate_find.user_id
      redirect_to root_path
    end
  end

  def estate_creator?
    unless estate_find.user == current_user
      flash[:notice] = "This is not your property!"
      redirect_to root_path
    end
  end

  def estate_params
      params.permit(
        :name,
        :price,
        :description,
        :adress,
        :zipcode,
        :city,
        pictures: []
      )
  end
end
