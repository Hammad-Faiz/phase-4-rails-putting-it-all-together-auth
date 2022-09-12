class UsersController < ApplicationController

  def create 
    user = User.create!(users_params)
    if user.valid?
      session[:user_id] = user.id
      render json: user, status: :created
    else 
      render json: {error: user.errors.full_messages}, status: :Unprocessable Entity
    end
  end

  def show 
    user = User.find_by(id: session[:user_id])
    render json: user, status: :created
  end

  private 
  def users_params
    params.permit(:username, :password, :image_url, :bio)
  end

end
