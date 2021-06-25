class UsersController < ApplicationController

  before_action :authenticate_user!, :verify_identity

  def show
    @user = find_user
  end

  def edit
    @user = find_user
  end

  def update
    @user = find_user
    unless params[:avatar].nil?
      @user.avatar.attach(params[:avatar])
    else
      @user.avatar.purge
    end

    if @user.update(permited_params)
      flash[:notice] = "User profile updated!"
      redirect_to user_path(@user)
    else
      flash.now[:notice] = "Ouppps !"
      render :edit
    end
  end

  private

  def verify_identity
    @user = find_user
    if @user != current_user
      flash[:notice] = "This is not your profile"
      redirect_to root_path
    end
  end

  def find_user
    User.find(params[:id])
  end

  def permited_params
    params.permit(:username)
  end
end

