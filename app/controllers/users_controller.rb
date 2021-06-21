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

    if @user.update(permited_params)
      flash[:notice] = "User profile updated!"
      redirect_to user_path(@user)
    else
      flash.now[:notice] = "Ouppps !"
      render :edit
    end
  end

  def create
    @user = User.new(permited_params)    
      if @user.save
        UserMailer.registration_confirmation(@user).deliver
        flash[:success] = "Please confirm your email address to continue"
        redirect_to root_path
      else
        flash[:error] = "Ooooppss, something went wrong!"
        render 'new'
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

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      flash[:success] = "Welcome to the House Of Coin! Your email has been confirmed.
      Please sign in to continue."
      redirect_to signin_url
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to root_url
    end

end

