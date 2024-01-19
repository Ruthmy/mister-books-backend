class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show update]
  # GET - get all users
  def index
    @users = User.all
    if @users.present?
      render json: { success: true, users: @users }
    else
      render json: { success: false, message: 'No users found' }
    end
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'User not found' }, status: :not_found
  end

  # GET - info about one user
  def show
    if @user.present?
      render json: { success: true, user: @user }
    else
      render json: { success: false, message: 'User not found' }
    end
  end

  def update
    if @user.update(user_params)
      render json: { success: true, user: @user }
    else
      render json: { error: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :username, :avatar, :bio, :country)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
