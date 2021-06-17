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
    @user.update(permited_params)
    redirect_to user_path(@user)
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
