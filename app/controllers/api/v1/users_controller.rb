class Api::V1::UsersController < ApplicationController

  # GET /users
  def index
    @users = User.where.not(id: current_user.id)

    render json: @users
  end

end
