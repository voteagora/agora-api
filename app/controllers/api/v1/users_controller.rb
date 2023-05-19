class Api::V1::UsersController < ApplicationController

  # GET /users
  def index
    @users = User.all
    render json: Jbuilder.new { |json| json.data User.all, :address }.target!
  end

  # GET /users/:address
  def show
    @user = User.find_by_address(params[:address])

    if @user.nil?
      render json: { error: "User not found" }, status: :not_found
      return
    else
     render json: Jbuilder.new { |json| json.data @user, :address }.target!
    end
  end

end

