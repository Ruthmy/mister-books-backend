class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all

    render json: @users
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'User not found' }, status: :not_found
  end
end
