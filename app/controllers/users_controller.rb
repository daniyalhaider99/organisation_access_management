# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.includes(:organizations)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.needs_parental_consent?
      @user.parental_consent = false
    end
    if @user.save
      if @user.needs_parental_consent?
        ParentalConsentMailerJob.perform_later(@user.id)
        redirect_to root_path, notice: 'Registration received. Parental consent required. Please check your parent/guardian email.'
      else
        redirect_to @user, notice: 'User was successfully created.'
      end
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :birthdate, :parent_email)
  end
end
